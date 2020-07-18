//
//  CoursesInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol CoursesRouterProtocol: class {
    func getView(courses: [Course]) -> UIViewController
}

protocol CoursesPresenterProtocol: class {
    func didLoadView()
}

protocol CoursesViewProtocol: class {
    var presenter: CoursesPresenterProtocol? { get set }
    func setCourses(_ courses: [Course])
}
