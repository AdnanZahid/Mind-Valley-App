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
    func setCategories(_ items: [Category])
    func showError()
}

protocol CategoryRepoProtocol: class {
    func fetchItems(successHandler: @escaping ([Category]) -> (),
                        failureHandler: @escaping () -> ())
}

protocol CategoryNetworkDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                        failureHandler: @escaping () -> ())
}

protocol CategoryMemoryDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                        failureHandler: @escaping () -> ())
    func saveCategories(data: Data)
}
