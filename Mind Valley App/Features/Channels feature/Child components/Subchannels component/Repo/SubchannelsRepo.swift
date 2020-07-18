//
//  SubchannelsRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
import Network

class SubchannelsRepo {
    
    private let networkDao: SubchannelsNetworkDaoProtocol
    private let memoryDao: SubchannelsMemoryDaoProtocol
    private let networkMonitor = NWPathMonitor()
    
    init(networkDao: SubchannelsNetworkDaoProtocol = SubchannelsNetworkDao(),
         memoryDao: SubchannelsMemoryDaoProtocol = SubchannelsMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension SubchannelsRepo: SubchannelsRepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Subchannel]) -> (),
                    failureHandler: @escaping () -> ()) {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            // If network is available, make a network call
            if path.status == .satisfied {
                self?.networkDao.fetchItems(successHandler: { [weak self] data in
                    do {
                        let items = try JSONDecoder().decode(SubchannelsList.self, from: data)
                        successHandler(items.data.channels)
                        self?.memoryDao.saveSubchannels(data: data)
                    } catch _ {
                        failureHandler()
                    }
                    }, failureHandler: failureHandler)
            } else {
                // Otherwise load data from the file (if available)
                self?.memoryDao.fetchItems(successHandler: { data in
                    do {
                        let items = try JSONDecoder().decode(SubchannelsList.self, from: data)
                        successHandler(items.data.channels)
                    } catch _ {
                        failureHandler()
                    }
                }, failureHandler: failureHandler)
            }
        }
        networkMonitor.start(queue: DispatchQueue.global(qos: .background))
    }
}
