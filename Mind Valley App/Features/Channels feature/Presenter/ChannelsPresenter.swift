//
//  ChannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsPresenter {
    
    private weak var view: ChannelsViewProtocol?
    
    init(view: ChannelsViewProtocol?) {
        self.view = view
    }
}

extension ChannelsPresenter: ChannelsPresenterProtocol {
    
    func didLoadView() {
        setItems()
    }
    
    private func setItems() {
        view?.setItems([NewEpisodesPresenter(),
                        SubchannelsPresenter(),
                        CategoryPresenter()])
    }
}
