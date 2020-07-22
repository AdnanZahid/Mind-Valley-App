//
//  CategoryMemoryDaoTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class CategoryMemoryDaoTests: XCTestCase {
    
    private var memoryHandler: MemoryHandlerProtocol?
    private var memoryDao: MemoryDaoProtocol?
    
    override func setUp() {
        super.setUp()
        memoryHandler = MockMemoryHandler()
        memoryDao = CategoryMemoryDao(memoryHandler: memoryHandler!)
    }
    
    override func tearDown() {
        memoryHandler = nil
        memoryDao = nil
        super.tearDown()
    }
    
    func testFetchItems() {
        memoryDao?.fetchItems(successHandler: { _ in },
                              failureHandler: {})
    }
}
