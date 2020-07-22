//
//  CategoryPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryPresenter {
    
    weak var view: ViewProtocol?
    private var repo: RepoProtocol
    
    init(repo: RepoProtocol = CategoryRepo()) {
        self.repo = repo
    }
}

extension CategoryPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "CategoryView"
    }
    
    func didLoadView() {
        fetchItems()
    }
    
    private func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.view?.setItems(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
