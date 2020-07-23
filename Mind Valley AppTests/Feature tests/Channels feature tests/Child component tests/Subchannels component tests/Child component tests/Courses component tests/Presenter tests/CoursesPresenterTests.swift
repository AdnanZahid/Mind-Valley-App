//
//  CoursesPresenterTests.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class CoursesPresenterTests: XCTestCase {
    
    private enum Constants {
        static let timeout = 1.0
    }
    
    private var view: ViewProtocol?
    private var repo: RepoProtocol?
    private var presenter: PresenterProtocol?
    private var viewExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        viewExpectation = XCTestExpectation(description: "Expectation for population of view")
        view = MockCoursesView(requestExpectation: viewExpectation!)
        let subchannel = Subchannel(title: "Dummy title",
                                    series: [],
                                    mediaCount: 0,
                                    latestMedia: [],
                                    id: "Dummy ID",
                                    iconAsset: nil,
                                    coverAsset: SubchannelCoverAsset(url: "Dummy cover asset"),
                                    slug: "Dummy slug")
        presenter = CoursesPresenter(subchannel: subchannel)
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
        wait(for: [viewExpectation!], timeout: Constants.timeout)
    }
}
