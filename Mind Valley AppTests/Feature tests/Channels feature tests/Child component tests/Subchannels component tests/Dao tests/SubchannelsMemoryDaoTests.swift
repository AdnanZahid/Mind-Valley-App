//
//  SubchannelsMemoryDaoTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class SubchannelsMemoryDaoTests: XCTestCase {
    
    private enum Constants {
        static let timeout = 1.0
    }
    
    private var memoryHandler: MockMemoryHandler?
    private var memoryDao: MemoryDaoProtocol?
    private var requestFromMemoryExpectation: XCTestExpectation?
    private var saveIntoMemoryExpectation: XCTestExpectation?
    private var requestSuccessExpectation: XCTestExpectation?
    private var requestFailureExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        requestFromMemoryExpectation = XCTestExpectation(description: "Expectation for requesting data from memory inside the memory handler class")
        saveIntoMemoryExpectation = XCTestExpectation(description: "Expectation for saving data into memory inside the memory handler class")
        requestSuccessExpectation = XCTestExpectation(description: "Expectation for requesting data from network success")
        requestFailureExpectation = XCTestExpectation(description: "Expectation for requesting data from network failure")
        memoryHandler = MockMemoryHandler(requestExpectation: requestFromMemoryExpectation!, saveExpectation: saveIntoMemoryExpectation!)
        memoryDao = NewEpisodesMemoryDao(memoryHandler: memoryHandler!)
    }
    
    override func tearDown() {
        memoryHandler = nil
        memoryDao = nil
        requestFromMemoryExpectation = nil
        saveIntoMemoryExpectation = nil
        requestSuccessExpectation = nil
        requestFailureExpectation = nil
        super.tearDown()
    }
    
    func testFetchItemsSuccess() {
        requestSuccessExpectation?.isInverted = false
        requestFailureExpectation?.isInverted = true
        memoryHandler?.shouldSucceed = true
        memoryDao?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromMemoryExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testFetchItemsFailure() {
        requestSuccessExpectation?.isInverted = true
        requestFailureExpectation?.isInverted = false
        memoryHandler?.shouldSucceed = false
        memoryDao?.fetchItems(successHandler: { [unowned self] _ in
            self.requestSuccessExpectation!.fulfill()
            }, failureHandler: { [unowned self] in
                self.requestFailureExpectation!.fulfill()
        })
        wait(for: [requestFromMemoryExpectation!, requestSuccessExpectation!, requestFailureExpectation!], timeout: Constants.timeout)
    }
    
    func testSaveItems() {
        memoryDao?.saveItems(data: Data())
        wait(for: [saveIntoMemoryExpectation!], timeout: Constants.timeout)
    }
}
