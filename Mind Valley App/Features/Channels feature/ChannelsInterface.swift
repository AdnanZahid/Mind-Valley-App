//
//  ChannelsPresenterInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol ChannelsPresenterProtocol {
    func getNewEpisodesView() -> UIViewController
    func getSubchannelsView() -> UIViewController
    func getCategoryView() -> UIViewController
}

protocol ChannelsViewProtocol: class {
    var presenter: ChannelsPresenterProtocol? { get set }
}

protocol ChannelsRouterProtocol {
    func present(on viewController: UIViewController, presentationMethod: PresentationMethod)
}
