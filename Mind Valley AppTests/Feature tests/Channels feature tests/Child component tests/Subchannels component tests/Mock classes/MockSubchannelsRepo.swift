//
//  MockSubchannelsRepo.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
@testable import Mind_Valley_App

class MockSubchannelsRepo: RepoProtocol {
    
    func fetchItems(successHandler: @escaping ([Codable]) -> (),
                    failureHandler: @escaping () -> ()) {
    }
}
