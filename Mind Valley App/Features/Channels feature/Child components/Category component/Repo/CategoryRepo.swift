//
//  CategoryRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class CategoryRepo {
    
    private let networkDao: NetworkDaoProtocol
    private let memoryDao: MemoryDaoProtocol
    
    init(networkDao: NetworkDaoProtocol = CategoryNetworkDao(),
         memoryDao: MemoryDaoProtocol = CategoryMemoryDao()) {
        self.networkDao = networkDao
        self.memoryDao = memoryDao
    }
}

extension CategoryRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
        let fetchFromMemoryHandler = {
            self.memoryDao.fetchItems(successHandler: { data in
                do {
                    let items = try JSONDecoder().decode(CategoriesList.self, from: data)
                    successHandler(items.data.categories)
                } catch _ {
                    failureHandler()
                }
            }, failureHandler: failureHandler)
        }
        self.networkDao.fetchItems(successHandler: { [weak self] data in
            do {
                let items = try JSONDecoder().decode(CategoriesList.self, from: data)
                successHandler(items.data.categories)
                self?.memoryDao.saveItems(data: data)
            } catch _ {
                fetchFromMemoryHandler()
            }
            }, failureHandler: fetchFromMemoryHandler)
    }
}
