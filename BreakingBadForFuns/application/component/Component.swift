//
//  Component.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import Foundation

class Component{
    
    fileprivate let repository: Repository = RepositoryImpl()
    
    func getEpisodesPresenter() -> EpisodesPresenter{
        let interactor = GetEpisodesByCategoryInteractor(repository: repository)
        return EpisodesPresenter(interactor: interactor)
    }
    
    func getSingleCharacterPresenter() -> CharacterPresenter{
        let interactor = GetCharacterByIdInteractor(repository: repository)
        let int = GetRandomQuoteByAuthorInteractor(repository: repository)
        let dcInt = GetDeathCountInteractor(repository: repository)
        return CharacterPresenter(interactor: interactor, int: int, dcInt: dcInt)
    }
    
    func getCharactersPresenter() -> CharactersListPresenter{
        let interactor = GetCharacterByCategoryInteractor(repository: repository)
        return CharactersListPresenter(getCharactersInteractor: interactor)
    }
    
    func getTestPresenter() -> TestPresenter{
        let interactor = GetRandomQuoteInteractor(repository: repository)
        return TestPresenter(getRandomQuoteInteractor: interactor)
    }
    
    func getMainPresenter() -> MainPresenter{
        let interactor = GetRandomQuoteInteractor(repository: repository)
        return MainPresenter(getRandomQuoteInteractor: interactor)
    }
}
