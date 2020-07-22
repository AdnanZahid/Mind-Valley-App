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
        static let animationInterval = 0.3
        static let internetViewDisappearInterval = 2
        static let internetViewShowConstraint: CGFloat = 0
        static let internetViewHideConstraint: CGFloat = -40
        enum BackgroundColor {
            static let red: CGFloat = 35/255
            static let green: CGFloat = 39/255
            static let blue: CGFloat = 47/255
            static let alpha: CGFloat = 1.0
        }
        enum TitleProperties {
            static let text = "Channels"
            enum Font {
                static let style = FontKit.Style.normal
                static let family = FontKit.Family.roboto
                static let weight = FontKit.Weight.bold
                static let size = FontKit.Size.heading
            }
            enum Color {
                static let red: CGFloat = 193/255
                static let green: CGFloat = 193/255
                static let blue: CGFloat = 193/255
                static let alpha: CGFloat = 1.0
            }
        }
        enum Error {
            static let title = "Error"
            static let message = "Either you have no internet connection or we couldn't load the data for you"
            static let dismissTitle = "Dismiss"
            static let actionTitle = "Try again"
        }
    }
    
    var presenter: PresenterProtocol?
    private var items: [PresenterProtocol] = []
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var internetAvailableViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var internetUnavailableViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupTitleLabel()
        setupTableView()
        setupLoadingView()
        setupPresenter()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: Constants.BackgroundColor.red,
                                       green: Constants.BackgroundColor.green,
                                       blue: Constants.BackgroundColor.blue,
                                       alpha: Constants.BackgroundColor.alpha)
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
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: String(describing: NewEpisodesView.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: NewEpisodesView.self))
        tableView.register(UINib.init(nibName: String(describing: SubchannelsView.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: SubchannelsView.self))
        tableView.register(UINib.init(nibName: String(describing: CategoryView.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: CategoryView.self))
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupLoadingView() {
        loadingView.isHidden = false
        tableView.isHidden = true
    }
    
    private func setupPresenter() {
        presenter?.networkAvailabilityView = self
        presenter?.didLoadView()
    }
}

extension ChannelsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let presenter = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: presenter.viewIdentifier),
            let view = cell as? ViewProtocol else { return UITableViewCell() }
        presenter.view = view
        view.setup(presenter: presenter)
        view.delegate = self
        return cell
    }
}

extension ChannelsViewController: ViewProtocol {
    
    func setItems(_ items: [Any]) {
        guard let items = items as? [PresenterProtocol] else { return }
        self.items = items
        tableView.reloadData()
    }
}

extension ChannelsViewController: ViewDelegateProtocol {
    
    func showData() {
        loadingView.isHidden = true
        tableView.isHidden = false
    }
    
    func showError() {
        guard let visibleViewController = navigationController?.visibleViewController,
            !(visibleViewController is UIAlertController) else { return }
        let error = UIAlertController(title: Constants.Error.title,
                                      message: Constants.Error.message,
                                      preferredStyle: .alert)
        error.addAction(UIAlertAction(title: Constants.Error.dismissTitle,
                                      style: .cancel))
        error.addAction(UIAlertAction(title: Constants.Error.actionTitle,
                                      style: .default) { [weak self] _ in
                                        self?.presenter?.didLoadView()
        })
        present(error, animated: true)
    }
}

extension ChannelsViewController: NetworkAvailabilityViewProtocol {
    
    func showInternetIsAvailable() {
        UIView.animate(withDuration: Constants.animationInterval) { [weak self] in
            self?.internetAvailableViewConstraint.constant = Constants.internetViewShowConstraint
            self?.view.layoutIfNeeded()
            let deadlineTime = DispatchTime.now() + .seconds(Constants.internetViewDisappearInterval)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                UIView.animate(withDuration: Constants.animationInterval) { [weak self] in
                    self?.internetAvailableViewConstraint.constant = Constants.internetViewHideConstraint
                    self?.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: Constants.animationInterval) { [weak self] in
                    self?.internetUnavailableViewConstraint.constant = Constants.internetViewHideConstraint
                    self?.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func showInternetIsUnavailable() {
        UIView.animate(withDuration: Constants.animationInterval) { [weak self] in
            self?.internetUnavailableViewConstraint.constant = Constants.internetViewShowConstraint
            self?.view.layoutIfNeeded()
        }
    }
}
