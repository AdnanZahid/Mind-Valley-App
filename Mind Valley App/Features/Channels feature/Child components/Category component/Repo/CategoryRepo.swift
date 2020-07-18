//
//  CategoryRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
import Network

class CategoryRepo {
    
    private let networkDao: CategoryNetworkDaoProtocol
    private let memoryDao: CategoryMemoryDaoProtocol
    private let networkMonitor = NWPathMonitor()
    
    init(networkDao: CategoryNetworkDaoProtocol = CategoryNetworkDao(),
         memoryDao: CategoryMemoryDaoProtocol = CategoryMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension CategoryRepo: CategoryRepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Category]) -> (),
                        failureHandler: @escaping () -> ()) {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            // If network is available, make a network call
            if path.status == .satisfied {
                self?.networkDao.fetchItems(successHandler: { [weak self] data in
                    do {
                        let items = try JSONDecoder().decode(CategoriesList.self, from: data)
                        successHandler(items.data.categories)
                        self?.memoryDao.saveCategories(data: data)
                    } catch _ {
                        failureHandler()
                    }
                    }, failureHandler: failureHandler)
            } else {
                // Otherwise load data from the file (if available)
                self?.memoryDao.fetchItems(successHandler: { data in
                    do {
                        let items = try JSONDecoder().decode(CategoriesList.self, from: data)
                        successHandler(items.data.categories)
                    } catch _ {
                        failureHandler()
                    }
                }, failureHandler: failureHandler)
            }
        }
        networkMonitor.start(queue: DispatchQueue.global(qos: .background))
    }
}
