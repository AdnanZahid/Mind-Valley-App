//
//  SubchannelsRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class SubchannelsRepo {
    
    private let networkDao: NetworkDaoProtocol
    private let memoryDao: MemoryDaoProtocol
    
    init(networkDao: NetworkDaoProtocol = SubchannelsNetworkDao(),
         memoryDao: MemoryDaoProtocol = SubchannelsMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension SubchannelsRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
        let fetchFromMemoryHandler = {
            self.memoryDao.fetchItems(successHandler: { data in
                do {
                    let items = try JSONDecoder().decode(SubchannelsList.self, from: data)
                    successHandler(items.data.channels)
                } catch _ {
                    failureHandler()
                }
            }, failureHandler: failureHandler)
        }
        self.networkDao.fetchItems(successHandler: { [weak self] data in
            do {
                let items = try JSONDecoder().decode(SubchannelsList.self, from: data)
                successHandler(items.data.channels)
                self?.memoryDao.saveItems(data: data)
            } catch _ {
                fetchFromMemoryHandler()
            }
            }, failureHandler: fetchFromMemoryHandler)
    }
}
