//
//  GetCharacterByCategoryInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetCharacterByCategoryInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getCharacterByCategory(category: MovieCategory) -> Observable<[CharacterModel]>{
        return self.repository.getCharacterByCategory(category: category)
    }
    
}
