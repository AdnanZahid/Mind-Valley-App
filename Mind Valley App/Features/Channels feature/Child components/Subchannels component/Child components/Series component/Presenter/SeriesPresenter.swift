//
//  SeriesPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SeriesPresenter {
    
    private weak var view: SeriesViewProtocol?
    private let series: [Series]
    
    init(view: SeriesViewProtocol?,
         series: [Series]) {
        self.view = view
        self.series = series
    }
}

extension SeriesPresenter: SeriesPresenterProtocol {
    
    func didLoadView() {
        setCourses()
    }
    
    private func setCourses() {
        view?.setSeries(series)
    }
}
