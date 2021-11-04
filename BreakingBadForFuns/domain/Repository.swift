//
//  Repository.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import Foundation
import RxSwift

protocol Repository{
    
    func getDeathCountByName(name: String) -> Observable<[DeathModel]>
    
    func getRandomQuoteByAuthor(name: String) -> Observable<[QouteModel]>
    
    func getRandomQuote() -> Observable<[QouteModel]>
    
    func getQuotesById(id: Int) -> Observable<[QouteModel]>
    
    func getQuotes() -> Observable<[QouteModel]>
    
    func getEpisodesByCategory(category: MovieCategory) -> Observable<[EpisodeModel]>
    
    func getEpisodes() -> Observable<[EpisodeModel]>
        
    func getRandomCharacter() -> Observable<[CharacterModel]>
    
    func getCharacterByCategory(category: MovieCategory) -> Observable<[CharacterModel]>
    
    func getAllCharacters() -> Observable<[CharacterModel]>
    
    func getCharacter(id: Int) ->  Observable<[CharacterModel]>
    
    //    func getQuotesByCategory(category: MovieCategory) -> Observable<[QouteModel]>

    
}
