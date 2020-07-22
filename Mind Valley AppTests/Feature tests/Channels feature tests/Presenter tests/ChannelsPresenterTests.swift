//
//  ChannelsPresenterTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class ChannelsPresenterTests: XCTestCase {
    
    private var view: ViewProtocol?
    private var presenter: PresenterProtocol?
    
    override func setUp() {
        super.setUp()
        view = MockChannelsView()
        presenter = ChannelsPresenter(view: view!)
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testDidLoadView() {
        presenter?.didLoadView()
    }
}
