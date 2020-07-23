//
//  MockCategoryRepo.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockCategoryRepo {
    
    private var requestExpectation: XCTestExpectation
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockCategoryRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        successHandler([Category(name: "Dummy category from repo")])
    }
}
