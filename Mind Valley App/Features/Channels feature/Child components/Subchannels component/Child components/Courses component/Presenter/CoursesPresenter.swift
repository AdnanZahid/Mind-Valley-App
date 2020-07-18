//
//  CoursesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CoursesPresenter {
    
    private weak var view: CoursesViewProtocol?
    private let courses: [Course]
    
    init(view: CoursesViewProtocol?,
         courses: [Course]) {
        self.view = view
        self.courses = courses
    }
}

extension CoursesPresenter: CoursesPresenterProtocol {
    
    func didLoadView() {
        setCourses()
    }
    
    private func setCourses() {
        view?.setCourses(courses)
    }
}
