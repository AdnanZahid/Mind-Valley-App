//
//  MemoryHandler.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 18/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MemoryHandler {
}

extension MemoryHandler: MemoryHandlerProtocol {
    
    func request(with info: RequestInfo,
                 successHandler: @escaping (Data) -> (),
                 failureHandler: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            let fileUrl = info.urlPath
            if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = directory.appendingPathComponent(fileUrl)
                do {
                    let data = try Data(contentsOf: fileURL)
                    DispatchQueue.main.async {
                        successHandler(data)
                    }
                } catch {
                    DispatchQueue.main.async {
                        failureHandler()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    failureHandler()
                }
            }
        }
    }
    
    func save(with info: RequestInfo,
              data: Data) {
        DispatchQueue.global(qos: .background).async {
            let fileUrl = info.urlPath
            let text = String(data: data, encoding: .utf8)
            if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = directory.appendingPathComponent(fileUrl)
                do {
                    try? text?.write(to: fileURL, atomically: false, encoding: .utf8)
                }
            }
        }
    }
}
