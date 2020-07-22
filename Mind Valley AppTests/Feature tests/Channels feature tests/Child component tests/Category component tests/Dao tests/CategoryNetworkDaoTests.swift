//
//  CategoryNetworkDaoTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class CategoryNetworkDaoTests: XCTestCase {
    
    private var network: NetworkProtocol?
    private var networkDao: NetworkDaoProtocol?
    
    override func setUp() {
        super.setUp()
        network = MockNetwork()
        networkDao = CategoryNetworkDao(network: network!)
    }
    
    override func tearDown() {
        network = nil
        networkDao = nil
        super.tearDown()
    }
    
    func testFetchItems() {
        networkDao?.fetchItems(successHandler: { _ in },
                               failureHandler: {})
    }
}
