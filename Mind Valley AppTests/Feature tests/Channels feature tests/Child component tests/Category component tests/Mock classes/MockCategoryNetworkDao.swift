//
//  MockCategoryNetworkDao.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockCategoryNetworkDao {
    
    private var requestExpectation: XCTestExpectation
    var shouldSucceed = false
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockCategoryNetworkDao: NetworkDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(try! JSONEncoder().encode(CategoriesList(data: CategoriesDataClass(categories: [Category(name: "Dummy category from network")]))))
        } else {
            failureHandler()
        }
    }
}
