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
    private let subchannel: Subchannel
    
    init(subchannel: Subchannel) {
        self.subchannel = subchannel
    }
}

extension CoursesPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "CoursesView"
    }
    
    func didLoadView() {
        fetchItems()
    }
    
    private func fetchItems() {
        (view as? CoursesView)?.setTitle(subchannel.title)
        (view as? CoursesView)?.setIconUrl(subchannel.iconAsset?.thumbnailURL ?? "")
        view?.setItems(subchannel.latestMedia)
    }
}
