//
//  CoursesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//
import UIKit

class CoursesPresenter {
    
    weak var view: ViewProtocol?
    private let items: [Codable]
    
    init(items: [Codable]) {
        self.items = items
    }
}

extension CoursesPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "CoursesView"
    }
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        view?.setItems(items)
    }
}
