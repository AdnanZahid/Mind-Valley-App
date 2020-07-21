//
//  SeriesView.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SeriesView: UITableViewCell {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "SeriesCell"
        static let cellWidth: CGFloat = 152
        static let cellHeight: CGFloat = 354
        static let iconCornerRadius: CGFloat = 25
        enum TitleProperties {
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.bold
                static let size = FontKit.Size.subHeading
            }
            enum Color {
                static let red: CGFloat = 255/255
                static let green: CGFloat = 255/255
                static let blue: CGFloat = 255/255
                static let alpha: CGFloat = 1.0
            }
        }
        enum SubtitleProperties {
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.bold
                static let size = FontKit.Size.title
            }
            enum Color {
                static let red: CGFloat = 149/255
                static let green: CGFloat = 152/255
                static let blue: CGFloat = 157/255
                static let alpha: CGFloat = 1.0
            }
        }
        enum SeparatorProperties {
            enum Color {
                static let red: CGFloat = 60/255
                static let green: CGFloat = 67/255
                static let blue: CGFloat = 78/255
                static let alpha: CGFloat = 1.0
            }
        }
    }
    
    var presenter: PresenterProtocol?
    private var items: [Codable] = []
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var bottomSeparator: UIView!
    
    func setup(presenter: PresenterProtocol) {
        setupBackground()
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupCollectionView()
        setupBottomSeparator()
        setupPresenter(presenter: presenter)
    }
    
    private func setupBackground() {
        backgroundColor = .clear
    }
    
    private func setupImageView() {
        imageView?.layer.cornerRadius = Constants.iconCornerRadius
        imageView?.layer.masksToBounds = true
        imageView?.clipsToBounds = true
    }
    
    private func setupTitleLabel() {
        titleLabel.textColor = UIColor(red: Constants.TitleProperties.Color.red,
                                       green: Constants.TitleProperties.Color.green,
                                       blue: Constants.TitleProperties.Color.blue,
                                       alpha: Constants.TitleProperties.Color.alpha)
        titleLabel.font = FontKit.font(style: Constants.TitleProperties.Font.style,
                                       family: Constants.TitleProperties.Font.family,
                                       weight: Constants.TitleProperties.Font.weight,
                                       size: Constants.TitleProperties.Font.size)
    }
    
    private func setupSubtitleLabel() {
        subtitleLabel.textColor = UIColor(red: Constants.SubtitleProperties.Color.red,
                                          green: Constants.SubtitleProperties.Color.green,
                                          blue: Constants.SubtitleProperties.Color.blue,
                                          alpha: Constants.SubtitleProperties.Color.alpha)
        subtitleLabel.font = FontKit.font(style: Constants.SubtitleProperties.Font.style,
                                          family: Constants.SubtitleProperties.Font.family,
                                          weight: Constants.SubtitleProperties.Font.weight,
                                          size: Constants.SubtitleProperties.Font.size)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib.init(nibName: String(describing: SeriesCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: SeriesCell.self))
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupBottomSeparator() {
        bottomSeparator.backgroundColor = UIColor(red: Constants.SeparatorProperties.Color.red,
                                                  green: Constants.SeparatorProperties.Color.green,
                                                  blue: Constants.SeparatorProperties.Color.blue,
                                                  alpha: Constants.SeparatorProperties.Color.alpha)
    }
    
    private func setupPresenter(presenter: PresenterProtocol) {
        self.presenter = presenter
        presenter.didLoadView()
    }
}

extension SeriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? SeriesCell,
            let item = items[indexPath.row] as? Series else { return UICollectionViewCell() }
        cell.setup(title: item.title, imageUrl: item.coverAsset.url)
        return cell
    }
}

extension SeriesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }
}

extension SeriesView: ViewProtocol {
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setIconUrl(_ iconUrl: String) {
        iconView.sd_setImage(with: URL(string: iconUrl))
    }
    
    func setItems(_ items: [Any]) {
        guard let items = items as? [Codable] else { return }
        self.items = items
        collectionView.reloadData()
    }
}
