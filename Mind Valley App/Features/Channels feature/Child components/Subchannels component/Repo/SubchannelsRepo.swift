//
//  SubchannelsRepo.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class SubchannelsRepo {
    
    let dao: SubchannelsDaoProtocol
    
    init(dao: SubchannelsDaoProtocol = SubchannelsDao()) {
        self.dao = dao
    }
}

extension SubchannelsRepo: SubchannelsRepoProtocol {
    
    func loadSubchannels(successHandler: @escaping ([Subchannel]) -> (),
                         failureHandler: @escaping () -> ()) {
        dao.loadSubchannels(successHandler: { data in
            do {
                let subchannels = try JSONDecoder().decode(SubchannelsList.self, from: data)
                successHandler(subchannels.data.channels)
            } catch _ {
                failureHandler()
            }
        }, failureHandler: failureHandler)
    }
}
