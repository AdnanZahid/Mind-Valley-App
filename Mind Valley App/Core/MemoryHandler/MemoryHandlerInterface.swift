//
//  MemoryHandlerInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol MemoryHandlerProtocol {
    func request(with info: RequestInfo,
                 successHandler: @escaping (Data) -> (),
                 failureHandler: @escaping () -> ())
    func save(with info: RequestInfo,
              data: Data)
}
