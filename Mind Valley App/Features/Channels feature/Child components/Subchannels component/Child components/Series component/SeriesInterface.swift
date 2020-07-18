//
//  SeriesInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

protocol SeriesRouterProtocol: class {
    func getView(series: [Series]) -> UIViewController
}

protocol SeriesPresenterProtocol: class {
    func didLoadView()
}

protocol SeriesViewProtocol: class {
    var presenter: SeriesPresenterProtocol? { get set }
    func setSeries(_ series: [Series])
}
