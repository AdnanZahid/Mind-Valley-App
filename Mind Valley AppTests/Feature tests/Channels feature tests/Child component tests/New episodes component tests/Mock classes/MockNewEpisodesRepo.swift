//
//  MockNewEpisodesRepo.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockNewEpisodesRepo {
    
    private var requestExpectation: XCTestExpectation
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockNewEpisodesRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
        requestExpectation.fulfill()
        successHandler([NewEpisode(type: "", title: "Dummy new episode from repo", coverAsset: CoverAsset(url: ""), channel: Channel(title: ""))])
    }
}
