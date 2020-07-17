//
//  ChannelsViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let bubbleCellIdentifier = "BubbleCell"
    }
    
    var presenter: ChannelsPresenter?
    private var categories: [Category] = []
    @IBOutlet private weak var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoriesCollectionView()
        presenter?.didLoadView()
    }
    
    private func setupCategoriesCollectionView() {
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
}

extension ChannelsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.bubbleCellIdentifier,
                                                            for: indexPath) as? BubbleCell else { return UICollectionViewCell() }
        cell.setup(title: categories[indexPath.row].name)
        return cell
    }
}

extension ChannelsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let space = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: size, height: size)
    }
}

extension ChannelsViewController: ChannelsViewProtocol {
    
    func setCategories(_ categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.reloadData()
    }
    
    func showError() {
        let error = UIAlertController(title: "Error",
                                      message: "Something unexpected happened",
                                      preferredStyle: .actionSheet)
        present(error, animated: true)
    }
}
