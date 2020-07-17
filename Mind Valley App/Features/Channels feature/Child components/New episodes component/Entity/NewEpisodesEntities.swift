//
//  NewEpisodesEntities.swift
//  Mind Valley App
//
//  Created by Adnan Zahid on 17/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

// MARK: - NewEpisodesList
struct NewEpisodesList: Codable {
    let data: NewEpisodesDataClass
}

// MARK: - DataClass
struct NewEpisodesDataClass: Codable {
    let media: [NewEpisode]
}

// MARK: - Media
struct NewEpisode: Codable {
    let type, title: String
    let coverAsset: CoverAsset
    let channel: Channel
}

// MARK: - Channel
struct Channel: Codable {
    let title: String
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String
}
