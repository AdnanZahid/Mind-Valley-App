//
//  SubchannelsInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol SubchannelsRouterProtocol: class {
    func getView() -> UIViewController
}

protocol SubchannelsPresenterProtocol: class {
    func didLoadView()
}

protocol SubchannelsViewProtocol: class {
    var presenter: SubchannelsPresenterProtocol? { get set }
    func setItems(_ items: [UIViewController])
    func showError()
}

protocol SubchannelsRepoProtocol: class {
    func fetchItems(successHandler: @escaping ([Subchannel]) -> (),
                         failureHandler: @escaping () -> ())
}

protocol SubchannelsNetworkDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
}

protocol SubchannelsMemoryDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
    func saveSubchannels(data: Data)
}
