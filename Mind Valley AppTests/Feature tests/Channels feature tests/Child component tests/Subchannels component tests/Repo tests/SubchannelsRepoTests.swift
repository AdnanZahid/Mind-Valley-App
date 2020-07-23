//
//  SubchannelsRepoTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class SubchannelsRepoTests: XCTestCase {
    
    private enum Constants {
        static let timeout = 1.0
    }
    
    private var memoryDao: MockSubchannelsMemoryDao?
    private var networkDao: MockSubchannelsNetworkDao?
    private var repo: RepoProtocol?
    private var requestFromNetworkExpectation: XCTestExpectation?
    private var requestFromMemoryExpectation: XCTestExpectation?
    private var saveIntoMemoryExpectation: XCTestExpectation?
    private var requestSuccessExpectation: XCTestExpectation?
    private var requestFailureExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        requestFromNetworkExpectation = XCTestExpectation(description: "Expectation for requesting data from network inside the network class")
        requestFromMemoryExpectation = XCTestExpectation(description: "Expectation for requesting data from memory inside the memory class")
        saveIntoMemoryExpectation = XCTestExpectation(description: "Expectation for saving data into memory inside the memory class")
        requestSuccessExpectation = XCTestExpectation(description: "Expectation for requesting data from network success")
        requestFailureExpectation = XCTestExpectation(description: "Expectation for requesting data from network failure")
        memoryDao = MockSubchannelsMemoryDao(requestExpectation: requestFromMemoryExpectation!, saveExpectation: saveIntoMemoryExpectation!)
        networkDao = MockSubchannelsNetworkDao(requestExpectation: requestFromNetworkExpectation!)
        repo = SubchannelsRepo(networkDao: networkDao!, memoryDao: memoryDao!)
    }
    
    override func tearDown() {
        requestFromNetworkExpectation = nil
        requestFromMemoryExpectation = nil
        saveIntoMemoryExpectation = nil
        requestSuccessExpectation = nil
        requestFailureExpectation = nil
        memoryDao = nil
        networkDao = nil
        repo = nil
        super.tearDown()
    }
    
    func testFetchItemsFromNetworkSuccess() {
        requestSuccessExpectation?.isInverted = false
        requestFailureExpectation?.isInverted = true
        networkDao?.shouldSucceed = true
        memoryDao?.shouldSucceed = false
        repo?.fetchItems(successHandler: { [unowned self] subchannels in
            XCTAssertEqual(subchannels.count, 1)
            XCTAssertEqual((subchannels as! [Subchannel]).first!.title, "Dummy sub channel from network")
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromNetworkExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testFetchItemsFromNetworkFailure() {
        requestSuccessExpectation?.isInverted = true
        requestFailureExpectation?.isInverted = false
        networkDao?.shouldSucceed = false
        memoryDao?.shouldSucceed = false
        repo?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromNetworkExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testFetchItemsFromMemorySuccess() {
        requestSuccessExpectation?.isInverted = false
        requestFailureExpectation?.isInverted = true
        networkDao?.shouldSucceed = false
        memoryDao?.shouldSucceed = true
        repo?.fetchItems(successHandler: { [unowned self] subchannels in
            XCTAssertEqual(subchannels.count, 1)
            XCTAssertEqual((subchannels as! [Subchannel]).first!.title, "Dummy sub channel from memory")
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromMemoryExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testFetchItemsFromMemoryFailure() {
        requestSuccessExpectation?.isInverted = true
        requestFailureExpectation?.isInverted = false
        networkDao?.shouldSucceed = false
        memoryDao?.shouldSucceed = false
        repo?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromMemoryExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testSaveItemsIntoMemory() {
        networkDao?.shouldSucceed = true
        repo?.fetchItems(successHandler: { _ in }, failureHandler: {}) // A simple fetch would save into memory if network call succeeds
        wait(for: [saveIntoMemoryExpectation!], timeout: Constants.timeout)
    }
}
