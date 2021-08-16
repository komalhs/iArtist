//
//  Tracks.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation

struct Tracks: Codable {
    
    let trackCount: Int
    let trackList: [TrackDetails]

    enum CodingKeys: String, CodingKey {
        case trackCount = "resultCount"
        case trackList = "results"
    }
}

struct TrackDetails: Codable {
    let artistName: String
    let trackName: String
    let trackPrice: Double
    let releaseDate: String
    let primaryGenreName: String
    let currency: String
}
