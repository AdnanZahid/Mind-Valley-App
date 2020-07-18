//
//  SeriesCell.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit
import SDWebImage

class SeriesCell: UICollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 25
        static let placeholderImageName = "placeholderImage"
        enum TitleProperties {
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.bold
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
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(title: String,
               imageUrl: String) {
        titleLabel.text = title
        imageView.sd_setImage(with: URL(string: imageUrl),
                              placeholderImage: UIImage(named: Constants.placeholderImageName))
    }
}
