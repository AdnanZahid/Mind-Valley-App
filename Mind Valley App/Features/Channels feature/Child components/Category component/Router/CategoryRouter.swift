//
//  CategoryRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryRouter {
    private var view: CategoryViewProtocol?
}

extension CategoryRouter: CategoryRouterProtocol {
    
    func getView() -> UIViewController {
        guard let view = UIStoryboard(name: "CategoryViewController",
                                      bundle: nil).instantiateInitialViewController() else { return UIViewController() }
        self.view = view as? CategoryViewProtocol
        let presenter = CategoryPresenter(view: self.view)
        self.view?.presenter = presenter
        return view
    }
}
