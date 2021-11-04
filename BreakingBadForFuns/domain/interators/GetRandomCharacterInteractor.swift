//
//  GetRandomCharacterInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetRandomCharacterInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getRandomCharacter() -> Observable<[CharacterModel]> {
        return self.repository.getRandomCharacter()
    }
    
}
