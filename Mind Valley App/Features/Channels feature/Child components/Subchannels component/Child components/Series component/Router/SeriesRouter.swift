//
//  SeriesRouter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SeriesRouter {
    private var view: SeriesViewProtocol?
}

extension SeriesRouter: SeriesRouterProtocol {
    
    func getView(series: [Series]) -> UIViewController {
        guard let view = UIStoryboard(name: "SeriesViewController",
                                      bundle: nil).instantiateInitialViewController() else { return UIViewController() }
        self.view = view as? SeriesViewProtocol
        let presenter = SeriesPresenter(view: self.view, series: series)
        self.view?.presenter = presenter
        return view
    }
}
