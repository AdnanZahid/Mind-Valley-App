//
//  NewEpisodesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class NewEpisodesPresenter {
    
    weak var view: ChannelsItemViewProtocol?
    private var repo: ChannelsItemRepoProtocol
    
    init(repo: ChannelsItemRepoProtocol = NewEpisodesRepo()) {
        self.repo = repo
    }
}

extension NewEpisodesPresenter: ChannelsItemPresenterProtocol {
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.view?.setItems(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
