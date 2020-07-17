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
