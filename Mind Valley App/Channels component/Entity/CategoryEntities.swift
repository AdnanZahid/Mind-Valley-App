//
//  CategoryEntities.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct CategoriesList: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let name: String
}
