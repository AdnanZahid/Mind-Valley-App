//
//  CategoryCell.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 25
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var bubbleView: UIView!
    
    func setup(title: String) {
        setupTitle(title)
        setupBubbleView()
    }
    
    private func setupTitle(_ title: String) {
        titleLabel.text = title
    }
    
    private func setupBubbleView() {
        bubbleView.layer.cornerRadius = Constants.cornerRadius
        bubbleView.layer.masksToBounds = true
    }
}
