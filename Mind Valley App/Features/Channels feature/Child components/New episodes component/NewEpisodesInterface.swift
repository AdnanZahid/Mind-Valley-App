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
    func loadNewEpisodes()
}

protocol NewEpisodesViewProtocol: class {
    var presenter: NewEpisodesPresenterProtocol? { get set }
    func setNewEpisodes(_ newEpisodes: [NewEpisode])
    func showError()
}

protocol NewEpisodesRepoProtocol: class {
    func loadNewEpisodes(successHandler: @escaping ([NewEpisode]) -> (),
                         failureHandler: @escaping () -> ())
}

protocol NewEpisodesDaoProtocol: class {
    func loadNewEpisodes(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ())
}
