//
//  SubchannelsRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsRouter {
    private var view: SubchannelsViewProtocol?
}

extension SubchannelsRouter: SubchannelsRouterProtocol {
    
    func getView() -> UIViewController {
        guard let view = UIStoryboard(name: "SubchannelsViewController",
                                      bundle: nil).instantiateInitialViewController() else { return UIViewController() }
        self.view = view as? SubchannelsViewProtocol
        let presenter = SubchannelsPresenter(view: self.view)
        self.view?.presenter = presenter
        return view
    }
}
