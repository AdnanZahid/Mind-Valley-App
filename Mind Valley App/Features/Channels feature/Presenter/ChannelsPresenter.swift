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
    private var subchannelsRouter: SubchannelsRouterProtocol
    private var categoryRouter: CategoryRouterProtocol
    
    init(view: ChannelsViewProtocol?,
         newEpisodesRouter: NewEpisodesRouterProtocol = NewEpisodesRouter(),
         subchannelsRouter: SubchannelsRouterProtocol = SubchannelsRouter(),
         categoryRouter: CategoryRouterProtocol = CategoryRouter()) {
        self.view = view
        self.newEpisodesRouter = newEpisodesRouter
        self.subchannelsRouter = subchannelsRouter
        self.categoryRouter = categoryRouter
    }
}

extension ChannelsPresenter: ChannelsPresenterProtocol {
    
    func getNewEpisodesView() -> UIViewController {
        return newEpisodesRouter.getView()
    }
    
    func getSubchannelsView() -> UIViewController {
        return subchannelsRouter.getView()
    }
    
    func getCategoryView() -> UIViewController {
        return categoryRouter.getView()
    }
}
