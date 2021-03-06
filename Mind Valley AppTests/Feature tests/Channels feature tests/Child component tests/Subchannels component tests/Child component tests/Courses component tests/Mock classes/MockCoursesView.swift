//
//  MockCoursesView.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import XCTest
@testable import Mind_Valley_App

class MockCoursesView {
    
    var presenter: PresenterProtocol?
    private var requestExpectation: XCTestExpectation
    
    init(requestExpectation: XCTestExpectation) {
        self.requestExpectation = requestExpectation
    }
}

extension MockCoursesView: ViewProtocol {
    
    func setItems(_ items: [Any]) {
        requestExpectation.fulfill()
    }
}
