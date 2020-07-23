//
//  MockMemoryHandler.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockMemoryHandler {
    
    private var requestExpectation: XCTestExpectation
    private var saveExpectation: XCTestExpectation
    var shouldSucceed = false
    
    init(requestExpectation: XCTestExpectation,
         saveExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
        self.saveExpectation = saveExpectation
    }
}

extension MockMemoryHandler: MemoryHandlerProtocol {
    
    func request(with info: RequestInfo, successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(Data())
        } else {
            failureHandler()
        }
    }
    
    func save(with info: RequestInfo, data: Data) {
        saveExpectation.fulfill()
    }
}
