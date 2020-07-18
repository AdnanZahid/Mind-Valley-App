//
//  ChannelsRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

enum PresentationMethod {
    case push
    case present
}

class ChannelsRouter {
    private var view: ChannelsViewProtocol?
}

extension ChannelsRouter: ChannelsRouterProtocol {
    
    func present(on viewController: UIViewController, presentationMethod: PresentationMethod) {
        guard let view = UIStoryboard(name: "ChannelsViewController",
                                      bundle: nil).instantiateInitialViewController() else { return }
        self.view = view as? ChannelsViewProtocol
        let presenter = ChannelsPresenter(view: self.view)
        self.view?.presenter = presenter
        switch presentationMethod {
        case .push:
            viewController.navigationController?.pushViewController(view, animated: true)
        case .present:
            viewController.present(view, animated: true)
        }
    }
}
