//
//  NewEpisodesDao.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class NewEpisodesDao {
    
    private enum Constants {
        static let urlPath = "z5AExTtw"
    }
    
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
}

extension NewEpisodesDao: NewEpisodesDaoProtocol {
    
    func loadNewEpisodes(successHandler: @escaping (Data) -> (),
                         failureHandler: @escaping () -> ()) {
        network.request(with: RequestInfo(urlPath: Constants.urlPath),
                        successHandler: successHandler,
                        failureHandler: failureHandler)
    }
}
