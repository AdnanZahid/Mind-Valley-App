//
//  MockMemoryHandler.swift
//  Mind Valley AppTests
//
//  Created by Adnan Zahid on 23/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation
@testable import Mind_Valley_App

class MockMemoryHandler: MemoryHandlerProtocol {
    
    func request(with info: RequestInfo, successHandler: @escaping (Data) -> (), failureHandler: @escaping () -> ()) {
    }
    
    func save(with info: RequestInfo, data: Data) {
    }
}
