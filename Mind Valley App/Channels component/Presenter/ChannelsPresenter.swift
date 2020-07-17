//
//  ChannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsPresenter {
    
    weak var view: ChannelsViewProtocol?
    var repo: ChannelsRepoProtocol
    
    init(view: ChannelsViewProtocol?,
         repo: ChannelsRepoProtocol = ChannelsRepo()) {
        self.view = view
        self.repo = repo
    }
}

extension ChannelsPresenter: ChannelsPresenterProtocol {
    
    func didLoadView() {
        loadCategories()
    }
    
    func loadCategories() {
        repo.loadCategories(successHandler: { [weak self] categories in
            self?.view?.setCategories(categories)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
