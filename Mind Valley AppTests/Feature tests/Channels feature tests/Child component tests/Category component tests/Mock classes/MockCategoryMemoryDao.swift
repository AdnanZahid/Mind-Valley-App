//
//  MockCategoryMemoryDao.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
@testable import Mind_Valley_App

class MockCategoryMemoryDao: MemoryDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
    }
    
    func saveItems(data: Data) {
    }
}
