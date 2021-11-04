//
//  GetAllCharacters.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetAllCharactersInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getAllCharacters() -> Observable<[CharacterModel]>{
        return self.repository.getAllCharacters()
    }
    
}
