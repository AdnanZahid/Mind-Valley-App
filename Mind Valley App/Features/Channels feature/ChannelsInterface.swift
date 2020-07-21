//
//  ChannelsPresenterInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol PresenterProtocol: class {
    var viewIdentifier: String { get }
    var view: ViewProtocol? { get set }
    func didLoadView()
}

protocol ViewProtocol: class {
    var presenter: PresenterProtocol? { get set }
    func setup(presenter: PresenterProtocol)
    func setItems(_ items: [Any])
    func showError()
}

extension ViewProtocol {
    func setup(presenter: PresenterProtocol) {} // Sometimes it is not required, hence the optionality
    func showError() {} // Sometimes it is not required, hence the optionality
}

protocol RepoProtocol: class {
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ())
}

protocol NetworkDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ())
}

protocol MemoryDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ())
    func saveItems(data: Data)
}
