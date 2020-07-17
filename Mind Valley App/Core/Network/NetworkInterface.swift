//
//  NetworkInterface.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func request(with info: RequestInfo,
                 successHandler: @escaping (Data) -> (),
                 failureHandler: @escaping () -> ())
}
