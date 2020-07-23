//
//  MockSubchannelsMemoryDao.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockSubchannelsMemoryDao {
    
    private var requestExpectation: XCTestExpectation
    private var saveExpectation: XCTestExpectation
    var shouldSucceed = false
    
    init(requestExpectation: XCTestExpectation,
         saveExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
        self.saveExpectation = saveExpectation
    }
}

extension MockSubchannelsMemoryDao: MemoryDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(try! JSONEncoder().encode(SubchannelsList(data: SubchannelsDataClass(channels: [Subchannel(title: "Dummy sub channel from memory",
                                                                                                                      series: [],
                                                                                                                      mediaCount: 0,
                                                                                                                      latestMedia: [],
                                                                                                                      id: nil,
                                                                                                                      iconAsset: nil,
                                                                                                                      coverAsset: SubchannelCoverAsset(url: ""),
                                                                                                                      slug: nil)]))))
        } else {
            failureHandler()
        }
    }
    
    func saveItems(data: Data) {
        saveExpectation.fulfill()
    }
}
