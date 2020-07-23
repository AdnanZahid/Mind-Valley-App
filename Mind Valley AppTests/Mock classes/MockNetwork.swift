//
//  MockNetwork.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockNetwork {
    
    private let requestExpectation: XCTestExpectation
    var shouldSucceed = true
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockNetwork: NetworkProtocol {
    
    func request(with info: RequestInfo, successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(Data())
        } else {
            failureHandler()
        }
    }
}
