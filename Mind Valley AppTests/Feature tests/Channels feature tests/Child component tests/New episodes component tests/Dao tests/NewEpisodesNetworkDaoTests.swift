//
//  NewEpisodesNetworkDaoTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class NewEpisodesNetworkDaoTests: XCTestCase {
    
    private enum Constants {
        static let timeout = 1.0
    }
    
    private var network: MockNetwork?
    private var networkDao: NetworkDaoProtocol?
    private var requestNetworkExpectation: XCTestExpectation?
    private var requestSuccessExpectation: XCTestExpectation?
    private var requestFailureExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        requestNetworkExpectation = XCTestExpectation(description: "Expectation for requesting data from network inside the network class")
        requestSuccessExpectation = XCTestExpectation(description: "Expectation for requesting data from network success")
        requestFailureExpectation = XCTestExpectation(description: "Expectation for requesting data from network failure")
        network = MockNetwork(requestExpectation: requestNetworkExpectation!)
        networkDao = NewEpisodesNetworkDao(network: network!)
    }
    
    override func tearDown() {
        network = nil
        networkDao = nil
        requestSuccessExpectation = nil
        requestFailureExpectation = nil
        super.tearDown()
    }
    
    func testFetchItemsSuccess() {
        requestSuccessExpectation?.isInverted = false
        requestFailureExpectation?.isInverted = true
        network?.shouldSucceed = true
        networkDao?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestNetworkExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testFetchItemsFailure() {
        requestSuccessExpectation?.isInverted = true
        requestFailureExpectation?.isInverted = false
        network?.shouldSucceed = false
        networkDao?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestNetworkExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
}
