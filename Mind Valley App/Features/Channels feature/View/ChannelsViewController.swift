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
    }
    
    var presenter: PresenterProtocol?
    private var items: [PresenterProtocol] = []
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupTitleLabel()
        setupTableView()
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
    
    private func setupPresenter() {
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
