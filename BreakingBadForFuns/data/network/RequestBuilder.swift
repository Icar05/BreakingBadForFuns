//
//  RequestBuilder.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import Foundation
import Alamofire

/**
 - [ ] /api/characters
 - [ ] /api/characters?category=Better+Call+Saul
 - [ ] /api/character/random
 - [ ] /api/characters?name=Walter

 - [ ] /api/episodes
 - [ ] /api/episodes?series=Better+Call+Saul

 - [ ] /api/quotes
 - [ ] /api/quotes/1
 - [ ] /api/quote?series=Better+Call+Saul
 - [ ] /api/quote/random

 - [ ] /api/deaths
 - [ ] /api/death-count
 - [ ] /api/random-death
 
 */
enum RequestBuilder : URLRequestConvertible {
    
    
    
    static let baseUrl = "https://www.breakingbadapi.com/api/"
    

  
    case getAllCharacters
    case getCharacterById(Int)
    case getCharacterByCategory(MovieCategory)
    case getRandomCharacter
    case getEpisodes
    case getEpisodesByCategory(MovieCategory)
    case getQuotes
    case getQuotesById(Int)
    case getQuotesByCategory(MovieCategory)
    case getRandomQuote
    case getRandomQuoteByAuthor(String)
    case getDeathCountByCharacter(String)

    
    var method: HTTPMethod {
        switch self {
        case .getAllCharacters: return .get
        case .getCharacterById: return .get
        case .getCharacterByCategory: return .get
        case .getRandomCharacter: return .get
        case .getEpisodes: return .get
        case .getEpisodesByCategory: return .get
        case .getQuotes: return .get
        case .getQuotesById: return .get
        case .getQuotesByCategory: return .get
        case .getRandomQuote: return .get
        case .getRandomQuoteByAuthor: return .get
        case .getDeathCountByCharacter: return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getCharacterById(_): return URLEncoding.default
        case .getAllCharacters: return URLEncoding.default
        case .getCharacterByCategory(_): return CustomGetEncoding()
        case .getRandomCharacter: return URLEncoding.default
        case .getEpisodes: return URLEncoding.default
        case .getEpisodesByCategory(_): return CustomGetEncoding()
        case .getQuotes: return URLEncoding.default
        case .getQuotesById(_): return URLEncoding.default
        case .getQuotesByCategory(_): return CustomGetEncoding()
        case .getRandomQuote: return URLEncoding.default
        case .getRandomQuoteByAuthor: return CustomGetEncoding()
        case .getDeathCountByCharacter: return CustomGetEncoding()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters?) = {
            switch self {
            case .getCharacterById(let id):
                return ("characters/\(id)", [:])
            case .getAllCharacters:
                return ("characters",[:])
            case .getCharacterByCategory(let category):
                return ("characters", ["category":category.toRequest()])
            case .getRandomCharacter:
                return ("character/random", [:])
            case .getEpisodes:
                return ("episodes", [:])
            case .getEpisodesByCategory(let category):
                return ("episodes", ["series":category.toRequest()])
            case .getQuotes:
                return ("quotes", [:])
            case .getQuotesById(let id):
                return ("quotes/\(id)", [:])
            case .getQuotesByCategory(let category):
                return ("quote", ["series":category.toRequest()])
            case .getRandomQuote:
                return ("quote/random", [:])
            case .getRandomQuoteByAuthor(let name):
                return ("quote/random", ["author":name])
            case .getDeathCountByCharacter(let name):
                return ("death-count", ["name":name])
            }
        }()
        
        let url = try RequestBuilder.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: result.parameters)
    }
}


struct CustomGetEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
                request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%2B", with: "+"))
                return request
    }
}

/**
 all api list
 
 - [ ] /api/characters?category=Better+Call+Saul
 - [ ] /api/character/random
 - [ ] /api/characters?limit=10&offset=10
 - [ ] /api/characters?name=Walter+White
 - [ ] /api/characters?name=Walter

 - [ ] /api/episodes
 - [ ] /api/episodes?series=Better+Call+Saul
 - [ ] /api/episodes/60

 - [ ] /api/quotes
 - [ ] /api/quotes/1
 - [ ] /api/quote?series=Better+Call+Saul
 - [ ] /api/quote/random
 - [ ] /api/quote?author=Jesse+Pinkman
 - [ ] /api/quote/random?author=Skyler+White

 - [ ] /api/deaths
 - [ ] /api/death?name=Walter+White
 - [ ] /api/death-count
 - [ ] /api/death-count?name=Gustavo+Fring


 - [ ] /api/random-death
 */

