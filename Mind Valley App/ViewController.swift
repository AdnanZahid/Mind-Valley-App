//
//  ViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constants {
        static let timeDelay = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Constants.timeDelay)) {
            ChannelsRouter().present(on: self, presentationMethod: .push)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
