//
//  CategoryViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "CategoryCell"
    }
    
    var presenter: CategoryPresenterProtocol?
    private var categories: [Category] = []
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoriesCollectionView()
        presenter?.didLoadView()
    }
    
    private func setupCategoriesCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        cell.setup(title: categories[indexPath.row].name)
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let space = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: size, height: size)
    }
}

extension CategoryViewController: CategoryViewProtocol {
    
    func setCategories(_ categories: [Category]) {
        self.categories = categories
        collectionView.reloadData()
    }
    
    func showError() {
        let error = UIAlertController(title: "Error",
                                      message: "Something unexpected happened",
                                      preferredStyle: .actionSheet)
        present(error, animated: true)
    }
}
