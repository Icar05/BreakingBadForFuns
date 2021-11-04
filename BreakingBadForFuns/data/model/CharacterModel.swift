//
//  CharacterModel.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import Foundation

struct CharacterModel : Decodable, Hashable{
    
    let charId: Int
    let name: String
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: String?
    let nickname: String?
    let appearance: [Int]?
    let portrayed: String?
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
    }
    
}

//"better_call_saul_appearance":"2,3,4,5"




