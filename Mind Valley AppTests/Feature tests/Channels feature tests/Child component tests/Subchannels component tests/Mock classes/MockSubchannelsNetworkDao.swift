//
//  MockSubchannelsNetworkDao.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockSubchannelsNetworkDao {
    
    private var requestExpectation: XCTestExpectation
    var shouldSucceed = false
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockSubchannelsNetworkDao: NetworkDaoProtocol {
    
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        if shouldSucceed {
            successHandler(try! JSONEncoder().encode(SubchannelsList(data: SubchannelsDataClass(channels: [Subchannel(title: "Dummy sub channel from network",
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
}
