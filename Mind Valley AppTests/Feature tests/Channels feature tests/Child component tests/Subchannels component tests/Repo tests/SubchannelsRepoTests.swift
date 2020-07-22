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
    
    private var memoryDao: MemoryDaoProtocol?
    private var networkDao: NetworkDaoProtocol?
    private var repo: RepoProtocol?
    
    override func setUp() {
        super.setUp()
        memoryDao = MockSubchannelsMemoryDao()
        networkDao = MockSubchannelsNetworkDao()
        repo = SubchannelsRepo(networkDao: networkDao!, memoryDao: memoryDao!)
    }
    
    override func tearDown() {
        memoryDao = nil
        networkDao = nil
        repo = nil
        super.tearDown()
    }
}
