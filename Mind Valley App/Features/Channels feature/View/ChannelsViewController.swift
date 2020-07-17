//
//  ChannelsViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {
    
    var presenter: ChannelsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNewEpisodesView()
        setupSubchannelsView()
//        setupCategoryView()
    }
    
    private func setupNewEpisodesView() {
        guard let presenter = presenter else { return }
        let childView = presenter.getNewEpisodesView()
        addChild(childView)
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
    
    private func setupSubchannelsView() {
        guard let presenter = presenter else { return }
        let childView = presenter.getSubchannelsView()
        addChild(childView)
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
    
    private func setupCategoryView() {
        guard let presenter = presenter else { return }
        let childView = presenter.getCategoryView()
        addChild(childView)
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}

extension ChannelsViewController: ChannelsViewProtocol {
}
