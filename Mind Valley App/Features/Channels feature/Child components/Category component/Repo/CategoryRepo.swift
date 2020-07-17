//
//  CategoryRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class CategoryRepo {
    
    let dao: CategoryDaoProtocol
    
    init(dao: CategoryDaoProtocol = CategoryDao()) {
        self.dao = dao
    }
}

extension CategoryRepo: CategoryRepoProtocol {
    
    func loadCategories(successHandler: @escaping ([Category]) -> (),
                        failureHandler: @escaping () -> ()) {
        dao.loadCategories(successHandler: { data in
            do {
                let categories = try JSONDecoder().decode(CategoriesList.self, from: data)
                successHandler(categories.data.categories)
            } catch _ {
                failureHandler()
            }
        }, failureHandler: failureHandler)
    }
}
