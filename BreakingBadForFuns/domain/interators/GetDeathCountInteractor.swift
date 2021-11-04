//
//  GetDeathCountInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import RxSwift

class GetDeathCountInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getDeathCount(name: String) -> Observable<[DeathModel]>{
        return self.repository.getDeathCountByName(name: name)
    }
    
}
