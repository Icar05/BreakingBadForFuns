//
//  QuoteModel.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 10.10.2021.
//

import Foundation

struct QouteModel: Decodable{
    
    var quoteId: UInt32
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quoteId = "quote_id"
        case quote, author
    }
}
