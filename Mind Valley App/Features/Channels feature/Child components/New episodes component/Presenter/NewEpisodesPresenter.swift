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
        fetchItems()
    }
    
    func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.view?.setNewEpisodes(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
