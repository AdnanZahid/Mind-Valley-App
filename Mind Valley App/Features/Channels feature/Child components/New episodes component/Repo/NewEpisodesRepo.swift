//
//  NewEpisodesRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class NewEpisodesRepo {
    
    let dao: NewEpisodesDaoProtocol
    
    init(dao: NewEpisodesDaoProtocol = NewEpisodesDao()) {
        self.dao = dao
    }
}

extension NewEpisodesRepo: NewEpisodesRepoProtocol {
    
    func loadNewEpisodes(successHandler: @escaping ([NewEpisodes]) -> (),
                         failureHandler: @escaping () -> ()) {
        dao.loadNewEpisodes(successHandler: { data in
            do {
                let newEpisodes = try JSONDecoder().decode(NewEpisodesList.self, from: data)
                successHandler(newEpisodes.data.media)
            } catch _ {
                failureHandler()
            }
        }, failureHandler: failureHandler)
    }
}
