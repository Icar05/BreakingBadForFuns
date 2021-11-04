//
//  RepositoryImpl.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import Foundation
import RxSwift

class RepositoryImpl: Repository{
    
    
    fileprivate let globalDataProvider = GlobalDataProviderImpl()
    
    
    
    func getDeathCountByName(name: String) -> Observable<[DeathModel]> {
        return self.globalDataProvider.getDeathCountByName(name: name)
    }
    
    func getRandomQuoteByAuthor(name: String) -> Observable<[QouteModel]> {
        return self.globalDataProvider.getRandomQuoteByAuthor(name: name)
    }
    
    func getRandomQuote() -> Observable<[QouteModel]> {
        return self.globalDataProvider.getRandomQuote()
    }
    
    func getQuotesById(id: Int) -> Observable<[QouteModel]> {
        return self.globalDataProvider.getQuotesById(id: id)
    }
    
    func getQuotes() -> Observable<[QouteModel]> {
        return self.globalDataProvider.getQuotes()
    }
    
    func getEpisodesByCategory(category: MovieCategory) -> Observable<[EpisodeModel]> {
        return self.globalDataProvider.getEpisodesByCategory(category: category)
    }
    
    func getEpisodes() -> Observable<[EpisodeModel]> {
        return self.globalDataProvider.getEpisodes()
    }
    
    func getRandomCharacter() -> Observable<[CharacterModel]> {
        return self.globalDataProvider.getRandomCharacter()
    }
    
    func getCharacterByCategory(category: MovieCategory) -> Observable<[CharacterModel]> {
        return self.globalDataProvider.getCharacterByCategory(category: category)
    }
    
    func getAllCharacters() -> Observable<[CharacterModel]> {
        return self.globalDataProvider.getAllCharacters()
    }
    
    func getCharacter(id: Int) -> Observable<[CharacterModel]> {
        return self.globalDataProvider.getCharacter(id: id)
    }
    
    //    func getQuotesByCategory(category: MovieCategory) -> Observable<[QouteModel]> {
    //        return networkService.getQuotesByCategory(category: category)
    //    }
    
    
}
