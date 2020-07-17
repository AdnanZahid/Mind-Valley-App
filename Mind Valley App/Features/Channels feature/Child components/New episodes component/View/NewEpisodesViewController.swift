//
//  NewEpisodesViewController.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class NewEpisodesViewController: UIViewController {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "NewEpisodesCell"
    }
    
    var presenter: NewEpisodesPresenterProtocol?
    private var newEpisodes: [NewEpisodes] = []
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewEpisodesCollectionView()
        presenter?.didLoadView()
    }
    
    private func setupNewEpisodesCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension NewEpisodesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newEpisodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? NewEpisodesCell else { return UICollectionViewCell() }
        let item = newEpisodes[indexPath.row]
        cell.setup(title: item.title, channelName: item.channel.title, imageUrl: item.coverAsset.url)
        return cell
    }
}

extension NewEpisodesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let space = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size = (collectionView.frame.size.width - space) / CGFloat(Constants.numberOfColumns)
        return CGSize(width: size, height: size)
    }
}

extension NewEpisodesViewController: NewEpisodesViewProtocol {
    
    func setNewEpisodes(_ newEpisodes: [NewEpisodes]) {
        self.newEpisodes = newEpisodes
        collectionView.reloadData()
    }
    
    func showError() {
        let error = UIAlertController(title: "Error",
                                      message: "Something unexpected happened",
                                      preferredStyle: .actionSheet)
        present(error, animated: true)
    }
}
