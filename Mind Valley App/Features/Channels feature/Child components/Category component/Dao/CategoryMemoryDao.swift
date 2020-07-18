//
//  CategoryMemoryDao.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class CategoryMemoryDao {
    
    private enum Constants {
        static let urlPath = "A0CgArX3"
    }
    
    let memoryHandler: MemoryHandlerProtocol
    
    init(memoryHandler: MemoryHandlerProtocol = MemoryHandler()) {
        self.memoryHandler = memoryHandler
    }
}

extension CategoryMemoryDao: CategoryMemoryDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (),
                        failureHandler: @escaping () -> ()) {
        memoryHandler.request(with: RequestInfo(urlPath: Constants.urlPath),
                              successHandler: successHandler,
                              failureHandler: failureHandler)
    }
    
    func saveCategories(data: Data) {
        memoryHandler.save(with: RequestInfo(urlPath: Constants.urlPath), data: data)
    }
}
