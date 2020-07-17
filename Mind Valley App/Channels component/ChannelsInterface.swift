//
//  ChannelsInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol ChannelsRouterProtocol: class {
    func present(on viewController: UIViewController, presentationMethod: PresentationMethod)
}

protocol ChannelsPresenterProtocol: class {
    var view: ChannelsViewProtocol? { get set }
    func didLoadView()
}

protocol ChannelsViewProtocol: class {
    var presenter: ChannelsPresenter? { get set }
    func setCategories(_ categories: [Category])
    func showError()
}

protocol ChannelsRepoProtocol: class {
    func loadCategories(successHandler: @escaping ([Category]) -> (),
                        failureHandler: @escaping () -> ())
}

protocol ChannelsDaoProtocol: class {
    func loadCategories(successHandler: @escaping (Data) -> (),
                        failureHandler: @escaping () -> ())
}
