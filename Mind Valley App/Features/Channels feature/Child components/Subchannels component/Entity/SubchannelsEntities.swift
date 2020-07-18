//
//  SubchannelsEntities.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

// MARK: - SubchannelsList
struct SubchannelsList: Codable {
    let data: SubchannelsDataClass
}

// MARK: - DataClass
struct SubchannelsDataClass: Codable {
    let channels: [Subchannel]
}

// MARK: - Channel
struct Subchannel: Codable {
    let title: String
    let series: [Series]
    let mediaCount: Int
    let latestMedia: [Course]
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: SubchannelCoverAsset
    let slug: String?
}

// MARK: - CoverAsset
struct SubchannelCoverAsset: Codable {
    let url: String
}

// MARK: - IconAsset
struct IconAsset: Codable {
    let thumbnailURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct Course: Codable {
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable {
    let title: String
    let coverAsset: CoverAsset
    let id: String?
}
