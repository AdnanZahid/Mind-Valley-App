//
//  SeriesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//
import UIKit

class SeriesPresenter {
    
    weak var view: ViewProtocol?
    private let items: [Codable]
    
    init(items: [Codable]) {
        self.items = items
    }
}

extension SeriesPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "SeriesView"
    }
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        view?.setItems(items)
    }
}
