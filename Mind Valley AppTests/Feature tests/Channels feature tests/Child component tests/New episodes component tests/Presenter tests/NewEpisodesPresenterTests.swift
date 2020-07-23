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
    
    private enum Constants {
        static let timeout = 1.0
    }
    
    private var view: ViewProtocol?
    private var repo: RepoProtocol?
    private var presenter: PresenterProtocol?
    private var viewExpectation: XCTestExpectation?
    private var repoExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        viewExpectation = XCTestExpectation(description: "Expectation for population of view")
        repoExpectation = XCTestExpectation(description: "Expectation for requesting data from repo")
        view = MockCoursesView(requestExpectation: viewExpectation!)
        repo = MockNewEpisodesRepo(requestExpectation: repoExpectation!)
        presenter = NewEpisodesPresenter(repo: repo!)
        presenter?.view = view
    }
    
    override func tearDown() {
        view = nil
        repo = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDidLoadView() {
        presenter?.didLoadView()
        wait(for: [viewExpectation!, repoExpectation!], timeout: Constants.timeout)
    }
}
