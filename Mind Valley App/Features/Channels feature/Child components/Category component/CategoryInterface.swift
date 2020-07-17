//
//  CategoryInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol CategoryRouterProtocol: class {
    func getView() -> UIViewController
}

protocol CategoryPresenterProtocol: class {
    func didLoadView()
}

protocol CategoryViewProtocol: class {
    var presenter: CategoryPresenterProtocol? { get set }
    func setCategories(_ categories: [Category])
    func showError()
}

protocol CategoryRepoProtocol: class {
    func loadCategories(successHandler: @escaping ([Category]) -> (),
                        failureHandler: @escaping () -> ())
}

protocol CategoryDaoProtocol: class {
    func loadCategories(successHandler: @escaping (Data) -> (),
                        failureHandler: @escaping () -> ())
}
