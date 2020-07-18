//
//  CoursesRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CoursesRouter {
    private var view: CoursesViewProtocol?
}

extension CoursesRouter: CoursesRouterProtocol {
    
    func getView(courses: [Course]) -> UIViewController {
        guard let view = UIStoryboard(name: "CoursesViewController",
                                      bundle: nil).instantiateInitialViewController() else { return UIViewController() }
        self.view = view as? CoursesViewProtocol
        let presenter = CoursesPresenter(view: self.view, courses: courses)
        self.view?.presenter = presenter
        return view
    }
}
