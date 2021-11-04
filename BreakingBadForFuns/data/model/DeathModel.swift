//
//  DeathModel.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import Foundation

struct DeathModel: Decodable{
    
    let name: String
    let deathCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name, deathCount
    }
}
