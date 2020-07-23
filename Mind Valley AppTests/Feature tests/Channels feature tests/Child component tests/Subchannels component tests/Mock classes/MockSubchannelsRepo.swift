//
//  MockSubchannelsRepo.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockSubchannelsRepo {
    
    private var requestExpectation: XCTestExpectation
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockSubchannelsRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        successHandler([Subchannel(title: "Dummy subchannel from repo",
                                   series: [],
                                   mediaCount: 0,
                                   latestMedia: [],
                                   id: nil,
                                   iconAsset: nil,
                                   coverAsset: SubchannelCoverAsset(url: ""),
                                   slug: nil)])
    }
}
