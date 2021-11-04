//
//  GlobalDataProviderImpl.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import RxSwift

class GlobalDataProviderImpl{
    
    
    
    
    fileprivate let decoder = JSONDecoder()
    
    fileprivate let networkService = NetworkService()
    
    
    func getDeathCountByName(name: String) -> Observable<[DeathModel]>{
        let request = try! RequestBuilder.getDeathCountByCharacter(name).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([DeathModel].self, from: response.data!)
        })
    }
    
    func getRandomQuoteByAuthor(name: String) -> Observable<[QouteModel]>{
        let request = try! RequestBuilder.getRandomQuoteByAuthor(name).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([QouteModel].self, from: response.data!)
        })
    }
    
    func getRandomQuote() -> Observable<[QouteModel]>{
        let request = try! RequestBuilder.getRandomQuote.asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([QouteModel].self, from: response.data!)
        })
    }
    
    func getQuotesByCategory(category: MovieCategory) -> Observable<[QouteModel]>{
        let request = try! RequestBuilder.getQuotesByCategory(category).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([QouteModel].self, from: response.data!)
        })
    }
    
    func getQuotesById(id: Int) -> Observable<[QouteModel]>{
        let request = try! RequestBuilder.getQuotesById(id).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([QouteModel].self, from: response.data!)
        })
    }
    
    func getQuotes() -> Observable<[QouteModel]>{
        let request = try! RequestBuilder.getQuotes.asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([QouteModel].self, from: response.data!)
        })
    }
    
    func getEpisodesByCategory(category: MovieCategory) -> Observable<[EpisodeModel]>{
        let request = try! RequestBuilder.getEpisodesByCategory(category).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([EpisodeModel].self, from: response.data!)
        })
    }
    
    func getEpisodes() -> Observable<[EpisodeModel]>{
        let request = try! RequestBuilder.getEpisodes.asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([EpisodeModel].self, from: response.data!)
        })
    }
    
    func getRandomCharacter() -> Observable<[CharacterModel]>{
        let request = try! RequestBuilder.getRandomCharacter.asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([CharacterModel].self, from: response.data!)
        })
    }
    
    func getCharacterByCategory(category: MovieCategory) -> Observable<[CharacterModel]>{
        let request = try! RequestBuilder.getCharacterByCategory(category).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([CharacterModel].self, from: response.data!)
        })
    }
    
    func getAllCharacters() -> Observable<[CharacterModel]>{
        let request = try! RequestBuilder.getAllCharacters.asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([CharacterModel].self, from: response.data!)
        })
    }
    
    func getCharacter(id: Int) ->  Observable<[CharacterModel]>{
        let request = try! RequestBuilder.getCharacterById(id).asURLRequest()
        return self.networkService.loadRequest(request: request, parceMethod: {response in
            return try self.decoder.decode([CharacterModel].self, from: response.data!)
        })
    }
    
}
