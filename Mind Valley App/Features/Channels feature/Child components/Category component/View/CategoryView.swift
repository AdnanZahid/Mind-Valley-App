//
//  CategoryView.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 20/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryView: UITableViewCell {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellWidth: CGFloat = 172
        static let cellHeight: CGFloat = 76
        static let cellIdentifier = "CategoryCell"
        enum TitleProperties {
            static let text = "Browse by items"
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
        enum Error {
            static let title = "Error"
            static let message = "Something unexpected happened"
            static let buttonTitle = "Dismiss"
        }
    }
    
    var presenter: PresenterProtocol?
    private var items: [Category] = []
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    
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
    
    private func setupCategoriesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: String(describing: CategoryCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func setupPresenter(_ presenter: PresenterProtocol) {
        self.presenter = presenter
        presenter.didLoadView()
    }
}

extension CategoryView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        cell.setup(title: items[indexPath.row].name)
        return cell
    }
}

extension CategoryView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let space = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: size, height: Constants.cellHeight)
    }
}

extension CategoryView: ViewProtocol {
    
    func setup(presenter: PresenterProtocol) {
        setupBackground()
        setupTitleLabel()
        setupCategoriesCollectionView()
        setupPresenter(presenter)
    }
    
    func setItems(_ items: [Any]) {
        guard let items = items as? [Category] else { return }
        self.items = items
        heightConstraint.constant = CGFloat(items.count/2 + 1) * Constants.cellHeight
        collectionView.reloadData()
    }
    
    func showError() {
    }
}
