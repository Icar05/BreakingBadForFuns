//
//  GetQuotesInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetQuotesInteractor {
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getQuotes() -> Observable<[QouteModel]> {
        return self.repository.getQuotes()
    }
    
}
