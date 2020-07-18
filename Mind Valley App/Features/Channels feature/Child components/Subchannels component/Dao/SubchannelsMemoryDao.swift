//
//  SubchannelsMemoryDao.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class SubchannelsMemoryDao {
    
    private enum Constants {
        static let urlPath = "Xt12uVhM"
    }
    
    let memoryHandler: MemoryHandlerProtocol
    
    init(memoryHandler: MemoryHandlerProtocol = MemoryHandler()) {
        self.memoryHandler = memoryHandler
    }
}

extension SubchannelsMemoryDao: SubchannelsMemoryDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ()) {
        memoryHandler.request(with: RequestInfo(urlPath: Constants.urlPath),
                              successHandler: successHandler,
                              failureHandler: failureHandler)
    }
    
    func saveSubchannels(data: Data) {
        memoryHandler.save(with: RequestInfo(urlPath: Constants.urlPath), data: data)
    }
}
