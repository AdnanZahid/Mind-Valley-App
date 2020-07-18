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
        static let cornerRadius: CGFloat = 30
        enum BubbleColor {
            static let red: CGFloat = 149/255
            static let green: CGFloat = 152/255
            static let blue: CGFloat = 157/255
            static let alpha: CGFloat = 0.2
        }
        enum TitleProperties {
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.regular
                static let size = FontKit.Size.title
            }
            enum Color {
                static let red: CGFloat = 255/255
                static let green: CGFloat = 255/255
                static let blue: CGFloat = 255/255
                static let alpha: CGFloat = 1.0
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var bubbleView: UIView!
    
    func setup(title: String) {
        setupTitle(title)
        setupBubbleView()
    }
    
    private func setupTitle(_ title: String) {
        titleLabel.text = title
        titleLabel.textColor = UIColor(red: Constants.TitleProperties.Color.red,
                                       green: Constants.TitleProperties.Color.green,
                                       blue: Constants.TitleProperties.Color.blue,
                                       alpha: Constants.TitleProperties.Color.alpha)
        titleLabel.font = FontKit.font(style: Constants.TitleProperties.Font.style,
                                       family: Constants.TitleProperties.Font.family,
                                       weight: Constants.TitleProperties.Font.weight,
                                       size: Constants.TitleProperties.Font.size)
    }
    
    private func setupBubbleView() {
        bubbleView.layer.cornerRadius = Constants.cornerRadius
        bubbleView.layer.masksToBounds = true
        bubbleView.backgroundColor = UIColor(red: Constants.BubbleColor.red,
                                             green: Constants.BubbleColor.green,
                                             blue: Constants.BubbleColor.blue,
                                             alpha: Constants.BubbleColor.alpha)
    }
}
