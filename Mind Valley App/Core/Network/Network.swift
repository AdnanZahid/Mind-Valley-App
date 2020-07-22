//
//  Network.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class Network {
    private enum Constants {
        static let baseUrl = "https://pastebin.com/raw/"
    }
}

extension Network: NetworkProtocol {
    
    func request(with info: RequestInfo,
                 successHandler: @escaping (Data) -> (),
                 failureHandler: @escaping () -> ()) {
        guard let url = URL(string: "\(Constants.baseUrl)\(info.urlPath)") else { return }
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession.init(configuration: config)
        DispatchQueue.global(qos: .background).async {
            let task = session.dataTask(with: request as URLRequest) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        failureHandler()
                    } else if let data = data {
                        successHandler(data)
                    }
                }
            }
            task.resume()
        }
    }
}
