//
//  NewEpisodesView.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class NewEpisodesView: UITableViewCell {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "NewEpisodesCell"
        static let cellWidth: CGFloat = 152
        static let cellHeight: CGFloat = 354
        static let cellSpacing: CGFloat = 20
        enum TitleProperties {
            static let text = "New Episodes"
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.bold
                static let size = FontKit.Size.subHeading
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
        enum Error {
            static let title = "Error"
            static let message = "Something unexpected happened"
            static let buttonTitle = "Dismiss"
        }
    }
    
    var presenter: PresenterProtocol?
    private var items: [Codable] = []
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var bottomSeparator: UIView!
    
    private func setupBackground() {
        backgroundColor = .clear
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Constants.TitleProperties.text
        titleLabel.textColor = UIColor(red: Constants.TitleProperties.Color.red,
                                       green: Constants.TitleProperties.Color.green,
                                       blue: Constants.TitleProperties.Color.blue,
                                       alpha: Constants.TitleProperties.Color.alpha)
        titleLabel.font = FontKit.font(style: Constants.TitleProperties.Font.style,
                                       family: Constants.TitleProperties.Font.family,
                                       weight: Constants.TitleProperties.Font.weight,
                                       size: Constants.TitleProperties.Font.size)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
        layout.sectionInset = UIEdgeInsets(top: Constants.cellSpacing,
                                           left: Constants.cellSpacing,
                                           bottom: Constants.cellSpacing,
                                           right: Constants.cellSpacing)
        layout.minimumLineSpacing = Constants.cellSpacing
        layout.minimumInteritemSpacing = Constants.cellSpacing
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib.init(nibName: String(describing: NewEpisodesCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: NewEpisodesCell.self))
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupBottomSeparator() {
        bottomSeparator.backgroundColor = UIColor(red: Constants.SeparatorProperties.Color.red,
                                                  green: Constants.SeparatorProperties.Color.green,
                                                  blue: Constants.SeparatorProperties.Color.blue,
                                                  alpha: Constants.SeparatorProperties.Color.alpha)
    }
    
    private func setupPresenter(_ presenter: PresenterProtocol) {
        self.presenter = presenter
        presenter.didLoadView()
    }
}

extension NewEpisodesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? NewEpisodesCell,
            let item = items[indexPath.row] as? NewEpisode else { return UICollectionViewCell() }
        cell.setup(title: item.title, subtitle: item.channel.title, imageUrl: item.coverAsset.url)
        return cell
    }
}

extension NewEpisodesView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }
}

extension NewEpisodesView: ViewProtocol {
    
    func setup(presenter: PresenterProtocol) {
        setupBackground()
        setupTitleLabel()
        setupCollectionView()
        setupBottomSeparator()
        setupPresenter(presenter)
    }
    
    func setItems(_ items: [Any]) {
        guard let items = items as? [Codable] else { return }
        self.items = items
        collectionView.reloadData()
    }
    
    func showError() {
        //        guard let visibleViewController = navigationController?.visibleViewController,
        //            !(visibleViewController is UIAlertController) else { return }
        //        let error = UIAlertController(title: Constants.Error.title,
        //                                      message: Constants.Error.message,
        //                                      preferredStyle: .alert)
        //        error.addAction(UIAlertAction(title: Constants.Error.buttonTitle,
        //                                      style: .default))
        //        present(error, animated: true)
    }
}
