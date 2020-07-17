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
    func loadSubchannels()
}

protocol SubchannelsViewProtocol: class {
    var presenter: SubchannelsPresenterProtocol? { get set }
    func setSubchannels(_ Subchannels: [Subchannel])
    func showError()
}

protocol SubchannelsRepoProtocol: class {
    func loadSubchannels(successHandler: @escaping ([Subchannel]) -> (),
                         failureHandler: @escaping () -> ())
}

protocol SubchannelsDaoProtocol: class {
    func loadSubchannels(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
}
