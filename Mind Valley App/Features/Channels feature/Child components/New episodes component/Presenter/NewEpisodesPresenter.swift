//
//  NewEpisodesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class NewEpisodesPresenter {
    
    private weak var view: NewEpisodesViewProtocol?
    private var repo: NewEpisodesRepoProtocol
    
    init(view: NewEpisodesViewProtocol?,
         repo: NewEpisodesRepoProtocol = NewEpisodesRepo()) {
        self.view = view
        self.repo = repo
    }
}

extension NewEpisodesPresenter: NewEpisodesPresenterProtocol {
    
    func didLoadView() {
        loadNewEpisodes()
    }
    
    func loadNewEpisodes() {
        repo.loadNewEpisodes(successHandler: { [weak self] newEpisodes in
            self?.view?.setNewEpisodes(newEpisodes)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
