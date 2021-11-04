//
//  GetCharacterById.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetCharacterByIdInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getCharacter(id: Int) -> Observable<[CharacterModel]>{
        return self.repository.getCharacter(id: id)
    }
    
}
