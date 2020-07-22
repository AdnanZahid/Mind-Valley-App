//
//  NewEpisodesPresenterTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class NewEpisodesPresenterTests: XCTestCase {
    
    private var view: ViewProtocol?
    private var repo: RepoProtocol?
    private var presenter: PresenterProtocol?
    
    override func setUp() {
        super.setUp()
        view = MockCoursesView()
        repo = MockNewEpisodesRepo()
        presenter = NewEpisodesPresenter(repo: repo!)
    }
    
    override func tearDown() {
        view = nil
        repo = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDidLoadView() {
        presenter?.didLoadView()
    }
}
