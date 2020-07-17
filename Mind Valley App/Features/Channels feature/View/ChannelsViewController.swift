//
//  ChannelsViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewEpisodesView()
//        setupCategoryView()
    }
    
    private func setupNewEpisodesView() {
        let childView = NewEpisodesRouter().getView()
        addChild(childView)
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
    
    private func setupCategoryView() {
        let childView = CategoryRouter().getView()
        addChild(childView)
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}
