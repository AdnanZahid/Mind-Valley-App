//
//  SubchannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsPresenter {
    
    private weak var view: SubchannelsViewProtocol?
    private var repo: SubchannelsRepoProtocol
    
    init(view: SubchannelsViewProtocol?,
         repo: SubchannelsRepoProtocol = SubchannelsRepo()) {
        self.view = view
        self.repo = repo
    }
}

extension SubchannelsPresenter: SubchannelsPresenterProtocol {
    
    func didLoadView() {
        loadSubchannels()
    }
    
    func loadSubchannels() {
        repo.loadSubchannels(successHandler: { [weak self] Subchannels in
            self?.view?.setSubchannels(Subchannels)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
}
