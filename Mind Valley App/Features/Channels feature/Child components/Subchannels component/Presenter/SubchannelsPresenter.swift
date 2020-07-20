//
//  SubchannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsPresenter {
    
    weak var view: ChannelsItemViewProtocol?
    private var repo: ChannelsItemRepoProtocol
    
    init(repo: ChannelsItemRepoProtocol = SubchannelsRepo()) {
        self.repo = repo
    }
}

extension SubchannelsPresenter: ChannelsItemPresenterProtocol {
    
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
        let items = [courses.map { [weak self] in self?.getCoursesViewIdentifier($0) },
                     series.map { [weak self] in self?.getSeriesViewIdentifier($0) }]
            .flatMap { $0 }
            .compactMap { $0 }
        view?.setItems(items)
    }
    
    private func getCoursesViewIdentifier(_ courses: [Course]) -> IdentifierItemsPair {
        return ("CoursesView", courses)
    }
    
    private func getSeriesViewIdentifier(_ series: [Series]) -> IdentifierItemsPair {
        return ("SeriesView", series)
    }
}
