//
//  NewEpisodesRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
import Network

class NewEpisodesRepo {
    
    private let networkDao: ChannelsItemNetworkDaoProtocol
    private let memoryDao: ChannelsItemMemoryDaoProtocol
    private let networkMonitor = NWPathMonitor()
    
    init(networkDao: ChannelsItemNetworkDaoProtocol = NewEpisodesNetworkDao(),
         memoryDao: ChannelsItemMemoryDaoProtocol = NewEpisodesMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension NewEpisodesRepo: ChannelsItemRepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                         failureHandler: @escaping () -> ()) {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            // If network is available, make a network call
            if path.status == .satisfied {
                self?.networkDao.fetchItems(successHandler: { [weak self] data in
                    do {
                        let items = try JSONDecoder().decode(NewEpisodesList.self, from: data)
                        successHandler(items.data.media)
                        self?.memoryDao.saveItems(data: data)
                    } catch _ {
                        failureHandler()
                    }
                    }, failureHandler: failureHandler)
            } else {
                // Otherwise load data from the file (if available)
                self?.memoryDao.fetchItems(successHandler: { data in
                    do {
                        let items = try JSONDecoder().decode(NewEpisodesList.self, from: data)
                        successHandler(items.data.media)
                    } catch _ {
                        failureHandler()
                    }
                }, failureHandler: failureHandler)
            }
        }
        networkMonitor.start(queue: DispatchQueue.global(qos: .background))
    }
}
