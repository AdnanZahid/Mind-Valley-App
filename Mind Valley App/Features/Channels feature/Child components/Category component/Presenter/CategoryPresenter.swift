//
//  CategoryPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryPresenter {
    
    private weak var view: CategoryViewProtocol?
    private var repo: CategoryRepoProtocol
    
    init(view: CategoryViewProtocol?,
         repo: CategoryRepoProtocol = CategoryRepo()) {
        self.view = view
        self.repo = repo
    }
}

extension CategoryPresenter: CategoryPresenterProtocol {
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.view?.setCategories(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
