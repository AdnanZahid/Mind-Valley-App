//
//  ChannelsPresenterInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

typealias IdentifierItemsPair = (identifier: String, items: [Codable])

protocol ChannelsItemPresenterProtocol: class {
    func didLoadView()
}

protocol ChannelsItemViewProtocol: class {
    var presenter: ChannelsItemPresenterProtocol? { get set }
    func setup(presenter: ChannelsItemPresenterProtocol)
    func setItems(_ items: [Any])
    func showError()
}

protocol ChannelsItemRepoProtocol: class {
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ())
}

protocol ChannelsItemNetworkDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ())
}

protocol ChannelsItemMemoryDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                    failureHandler: @escaping () -> ())
    func saveItems(data: Data)
}
