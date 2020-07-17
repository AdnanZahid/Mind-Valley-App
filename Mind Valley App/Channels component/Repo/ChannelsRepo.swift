//
//  ChannelsRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class ChannelsRepo {
    
    let dao: ChannelsDaoProtocol
    
    init(dao: ChannelsDaoProtocol = ChannelsDao()) {
        self.dao = dao
    }
}

extension ChannelsRepo: ChannelsRepoProtocol {
    
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
