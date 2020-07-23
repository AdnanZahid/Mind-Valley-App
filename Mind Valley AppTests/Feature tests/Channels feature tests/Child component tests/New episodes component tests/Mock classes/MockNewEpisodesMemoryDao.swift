//
//  MockNewEpisodesMemoryDao.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockNewEpisodesMemoryDao {
    
    private var requestExpectation: XCTestExpectation
    private var saveExpectation: XCTestExpectation
    var shouldSucceed = false
    
    init(requestExpectation: XCTestExpectation,
         saveExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
        self.saveExpectation = saveExpectation
    }
}

extension MockNewEpisodesMemoryDao: MemoryDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(try! JSONEncoder().encode(NewEpisodesList(data: NewEpisodesDataClass(media: [NewEpisode(type: "",
                                                                                                                   title: "Dummy new episode from memory",
                                                                                                                   coverAsset: CoverAsset(url: ""),
                                                                                                                   channel: Channel(title: ""))]))))
        } else {
            failureHandler()
        }
    }
    
    func saveItems(data: Data) {
        saveExpectation.fulfill()
    }
}
