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
    
    private var view: ViewProtocol?
    private var presenter: PresenterProtocol?
    
    override func setUp() {
        super.setUp()
        view = MockCoursesView()
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDidLoadView() {
        let subchannel = Subchannel(title: "Dummy title",
                                    series: [],
                                    mediaCount: 0,
                                    latestMedia: [],
                                    id: "Dummy ID",
                                    iconAsset: nil,
                                    coverAsset: SubchannelCoverAsset(url: "Dummy cover asset"),
                                    slug: "Dummy slug")
        presenter = CoursesPresenter(subchannel: subchannel)
        presenter?.didLoadView()
    }
}
