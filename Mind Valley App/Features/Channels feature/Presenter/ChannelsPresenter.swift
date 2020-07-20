//
//  ChannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsPresenter {
    
    weak var view: ViewProtocol?
    
    init(view: ViewProtocol?) {
        self.view = view
    }
}

extension ChannelsPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "" // Intentionally kept empty
    }
    
    func didLoadView() {
        setItems()
    }
    
    private func setItems() {
        view?.setItems([NewEpisodesPresenter(),
                        SubchannelsPresenter(),
                        CategoryPresenter()])
    }
}
