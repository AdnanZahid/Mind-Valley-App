//
//  SubchannelsView.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsView: UITableViewCell {
    
    private enum Constants {
        static let numberOfColumns = 2
        static let cellIdentifier = "SubchannelsCell"
        enum Error {
            static let title = "Error"
            static let message = "Something unexpected happened"
            static let buttonTitle = "Dismiss"
        }
    }
    
    var presenter: PresenterProtocol?
    private var items: [PresenterProtocol] = []
    @IBOutlet private weak var tableView: UITableView!
    
    func setup(presenter: PresenterProtocol) {
        setupBackground()
        setupTableView()
        setupPresenter(presenter: presenter)
    }
    
    private func setupBackground() {
        backgroundColor = .clear
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = 500.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(UINib.init(nibName: String(describing: CoursesView.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: CoursesView.self))
        tableView.register(UINib.init(nibName: String(describing: SeriesView.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: SeriesView.self))
    }
    
    private func setupPresenter(presenter: PresenterProtocol) {
        self.presenter = presenter
        presenter.didLoadView()
    }
}

extension SubchannelsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let presenter = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: presenter.viewIdentifier),
            let view = cell as? ViewProtocol else { return UITableViewCell() }
        presenter.view = view
        view.setup(presenter: presenter)
        return cell
    }
}

extension SubchannelsView: ViewProtocol {
    
    func setItems(_ items: [Any]) {
        guard let items = items as? [PresenterProtocol] else { return }
        self.items = items
        tableView.reloadData()
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
