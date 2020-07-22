//
//  ChannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit
import Network

class ChannelsPresenter {
    
    weak var view: ViewProtocol?
    weak var networkAvailabilityView: NetworkAvailabilityViewProtocol?
    private let networkMonitor = NWPathMonitor()
    private var isInternetAvailable = true
    
    init(view: ViewProtocol?) {
        self.view = view
    }
}

extension ChannelsPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "" // Intentionally kept empty
    }
    
    func didLoadView() {
        setItems()
        setupNetworkMonitor()
    }
    
    private func setItems() {
        view?.setItems([NewEpisodesPresenter(),
                        SubchannelsPresenter(),
                        CategoryPresenter()])
    }
    
    private func setupNetworkMonitor() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    if self.isInternetAvailable == false { self.networkAvailabilityView?.showInternetIsAvailable() }
                    self.isInternetAvailable = true
                    self.setItems()
                } else {
                    self.networkAvailabilityView?.showInternetIsUnavailable()
                    self.isInternetAvailable = false
                }
            }
        }
        networkMonitor.start(queue: DispatchQueue.global(qos: .background))
    }
}
