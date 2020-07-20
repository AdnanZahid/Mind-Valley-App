//
//  SubchannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsPresenter {
    
    weak var view: ViewProtocol?
    private var repo: RepoProtocol
    
    init(repo: RepoProtocol = SubchannelsRepo()) {
        self.repo = repo
    }
}

extension SubchannelsPresenter: PresenterProtocol {
    
    var viewIdentifier: String {
        return "SubchannelsView"
    }
    
    func didLoadView() {
        fetchItems()
    }
    
    func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.setItems(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
    
    private func setItems(_ items: [Any]) {
        guard let subchannels = items as? [Subchannel] else { return }
        let courses = subchannels.filter { $0.series.isEmpty }.map { $0.latestMedia }
        let series = subchannels.filter { !$0.series.isEmpty }.map { $0.series }
        guard let items = [courses.map { CoursesPresenter(items: $0) },
                           series.map { SeriesPresenter(items: $0) }] as? [[PresenterProtocol]] else { return }
        view?.setItems(items.flatMap { $0 }.compactMap { $0 })
    }
}
