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
    
    var presenter: ChannelsPresenterProtocol?
    private var items: [UIViewController] = []
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
        tableView.delegate = self
        //        tableView.estimatedRowHeight = 300.0
        //        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
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
        let cell = UITableViewCell()
        let childView = items[indexPath.row]
        addChild(childView)
        cell.contentView.addSubview(childView.view)
        cell.backgroundColor = .clear
        return cell
    }
}

extension ChannelsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 5000
    }
}

extension ChannelsViewController: ChannelsViewProtocol {
    
    func setItems(_ items: [UIViewController]) {
        self.items = items
        tableView.reloadData()
    }
}
