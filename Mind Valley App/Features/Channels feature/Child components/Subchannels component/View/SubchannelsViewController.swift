//
//  SubchannelsViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsViewController: UIViewController {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "SubchannelsCell"
    }
    
    var presenter: SubchannelsPresenterProtocol?
    private var subchannels: [Subchannel] = []
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubchannelsCollectionView()
        presenter?.didLoadView()
    }
    
    private func setupSubchannelsCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension SubchannelsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subchannels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? SubchannelsCell else { return UICollectionViewCell() }
        let item = subchannels[indexPath.row]
        cell.setup(title: item.title, imageUrl: item.coverAsset.url)
        return cell
    }
}

extension SubchannelsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let space = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: size, height: size)
    }
}

extension SubchannelsViewController: SubchannelsViewProtocol {
    
    func setSubchannels(_ subchannels: [Subchannel]) {
        self.subchannels = subchannels
        collectionView.reloadData()
    }
    
    func showError() {
        let error = UIAlertController(title: "Error",
                                      message: "Something unexpected happened",
                                      preferredStyle: .actionSheet)
        present(error, animated: true)
    }
}
