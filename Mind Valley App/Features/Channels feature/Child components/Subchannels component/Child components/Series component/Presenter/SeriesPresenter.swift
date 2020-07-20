//
//  SeriesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//
import UIKit

class SeriesPresenter {
    
    private weak var view: ChannelsItemViewProtocol?
    private let items: [Codable]
    
    init(view: ChannelsItemViewProtocol?,
         items: [Codable]) {
        self.view = view
        self.items = items
    }
}

extension SeriesPresenter: ChannelsItemPresenterProtocol {
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        view?.setItems(items)
    }
}
