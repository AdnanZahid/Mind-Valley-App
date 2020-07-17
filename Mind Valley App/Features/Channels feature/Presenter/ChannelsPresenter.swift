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
    private var newEpisodesRouter: NewEpisodesRouterProtocol
    private var categoryRouter: CategoryRouterProtocol
    
    init(view: ChannelsViewProtocol?,
         newEpisodesRouter: NewEpisodesRouterProtocol = NewEpisodesRouter(),
         categoryRouter: CategoryRouterProtocol = CategoryRouter()) {
        self.view = view
        self.newEpisodesRouter = newEpisodesRouter
        self.categoryRouter = categoryRouter
    }
}

extension ChannelsPresenter: ChannelsPresenterProtocol {
    
    func getNewEpisodesView() -> UIViewController {
        return newEpisodesRouter.getView()
    }
    
    func getChannelsView() -> UIViewController {
        return UIViewController()
    }
    
    func getCategoryView() -> UIViewController {
        return categoryRouter.getView()
    }
}
