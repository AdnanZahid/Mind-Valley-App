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
        enum Error {
            static let title = "Error"
            static let message = "Something unexpected happened"
            static let buttonTitle = "Dismiss"
        }
    }
    
    var presenter: SubchannelsPresenterProtocol?
    private var items: [UIViewController] = []
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupTableView()
        setupPresenter()
    }
    
    private func setupBackground() {
        view.backgroundColor = .clear
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }
    
    private func setupPresenter() {
        presenter?.didLoadView()
    }
}

extension SubchannelsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let childView = items[indexPath.row]
        addChild(childView)
        cell.contentView.addSubview(childView.view)
        cell.backgroundColor = .clear
        return cell
    }
}

extension SubchannelsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 2000
    }
}

extension SubchannelsViewController: SubchannelsViewProtocol {
    
    func setItems(_ items: [UIViewController]) {
        self.items = items
        tableView.reloadData()
    }
    
    func showError() {
        guard let visibleViewController = navigationController?.visibleViewController,
            !(visibleViewController is UIAlertController) else { return }
        let error = UIAlertController(title: Constants.Error.title,
                                      message: Constants.Error.message,
                                      preferredStyle: .alert)
        error.addAction(UIAlertAction(title: Constants.Error.buttonTitle,
                                      style: .default))
        present(error, animated: true)
    }
}
