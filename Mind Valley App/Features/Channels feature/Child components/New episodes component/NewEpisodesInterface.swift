//
//  NewEpisodesInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol NewEpisodesRouterProtocol: class {
    func getView() -> UIViewController
}

protocol NewEpisodesPresenterProtocol: class {
    func didLoadView()
    func fetchItems()
}

protocol NewEpisodesViewProtocol: class {
    var presenter: NewEpisodesPresenterProtocol? { get set }
    func setNewEpisodes(_ items: [NewEpisode])
    func showError()
}

protocol NewEpisodesRepoProtocol: class {
    func fetchItems(successHandler: @escaping ([NewEpisode]) -> (),
                         failureHandler: @escaping () -> ())
}

protocol NewEpisodesNetworkDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
}

protocol NewEpisodesMemoryDaoProtocol: class {
    func fetchItems(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
    func saveNewEpisodes(data: Data)
}
