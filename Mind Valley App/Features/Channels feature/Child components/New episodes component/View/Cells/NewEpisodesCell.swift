//
//  NewEpisodesCell.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit
import SDWebImage

class NewEpisodesCell: UICollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 25
        static let placeholderImageName = "placeholderImage"
    }
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var channelNameLabel: UILabel!
    
    func setup(title: String,
               channelName: String,
               imageUrl: String) {
        titleLabel.text = title
        channelNameLabel.text = channelName
        imageView.sd_setImage(with: URL(string: imageUrl),
                              placeholderImage: UIImage(named: Constants.placeholderImageName))
    }
}
