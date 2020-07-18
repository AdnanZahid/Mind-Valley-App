//
//  SubchannelsPresenter.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import UIKit

class SubchannelsPresenter {
    
    private weak var view: SubchannelsViewProtocol?
    private var repo: SubchannelsRepoProtocol
    private var coursesRouter: CoursesRouterProtocol
    private var seriesRouter: SeriesRouterProtocol
    
    init(view: SubchannelsViewProtocol?,
         repo: SubchannelsRepoProtocol = SubchannelsRepo(),
         coursesRouter: CoursesRouterProtocol = CoursesRouter(),
         seriesRouter: SeriesRouterProtocol = SeriesRouter()) {
        self.view = view
        self.repo = repo
        self.coursesRouter = coursesRouter
        self.seriesRouter = seriesRouter
    }
}

extension SubchannelsPresenter: SubchannelsPresenterProtocol {
    
    func didLoadView() {
        fetchItems()
    }
    
    private func fetchItems() {
        repo.fetchItems(successHandler: { [weak self] items in
            self?.setItems(items)
            }, failureHandler: { [weak self] in
                self?.view?.showError()
        })
    }
    
    private func setItems(_ items: [Subchannel]) {
        let courses = items.filter { $0.series.isEmpty }.map { $0.latestMedia }
        let series = items.filter { !$0.series.isEmpty }.map { $0.series }
        let items = [courses.map { [weak self] in self?.getCoursesView($0) },
                     series.map { [weak self] in self?.getSeriesView($0) }]
            .flatMap { $0 }
            .compactMap { $0 }
        view?.setItems(items)
    }
    
    private func getCoursesView(_ courses: [Course]) -> UIViewController {
        return coursesRouter.getView(courses: courses)
    }
    
    private func getSeriesView(_ series: [Series]) -> UIViewController {
        return seriesRouter.getView(series: series)
    }
}
