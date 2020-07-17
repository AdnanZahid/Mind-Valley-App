//
//  NewEpisodesRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class NewEpisodesRouter {
    private var view: NewEpisodesViewProtocol?
}

extension NewEpisodesRouter: NewEpisodesRouterProtocol {
    
    func getView() -> UIViewController {
        guard let view = UIStoryboard(name: "NewEpisodesViewController",
                                      bundle: nil).instantiateInitialViewController() else { return UIViewController() }
        self.view = view as? NewEpisodesViewProtocol
        let presenter = NewEpisodesPresenter(view: self.view)
        self.view?.presenter = presenter
        return view
    }
}
