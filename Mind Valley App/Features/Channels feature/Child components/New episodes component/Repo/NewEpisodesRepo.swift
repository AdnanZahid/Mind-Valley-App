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
    
    private let networkDao: NewEpisodesNetworkDaoProtocol
    private let memoryDao: NewEpisodesMemoryDaoProtocol
    private let networkMonitor = NWPathMonitor()
    
    init(networkDao: NewEpisodesNetworkDaoProtocol = NewEpisodesNetworkDao(),
         memoryDao: NewEpisodesMemoryDaoProtocol = NewEpisodesMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension NewEpisodesRepo: NewEpisodesRepoProtocol {
    
    func fetchItems(successHandler: @escaping ([NewEpisode]) -> (),
                         failureHandler: @escaping () -> ()) {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            // If network is available, make a network call
            if path.status == .satisfied {
                self?.networkDao.fetchItems(successHandler: { [weak self] data in
                    do {
                        let items = try JSONDecoder().decode(NewEpisodesList.self, from: data)
                        successHandler(items.data.media)
                        self?.memoryDao.saveNewEpisodes(data: data)
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
