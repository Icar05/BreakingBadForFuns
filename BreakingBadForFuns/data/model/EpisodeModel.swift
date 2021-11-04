//
//  EpisodeModel.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 10.10.2021.
//

import Foundation

struct EpisodeModel: Decodable, Hashable{
    
    
    let episodeId: Int
    let title: String
    let season: String?
    let episode: String?
    let airDate: String?
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case title
        case season
        case episode
        case airDate = "air_date"
        case characters
    }
}
