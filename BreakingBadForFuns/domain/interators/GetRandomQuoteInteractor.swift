//
//  GetRandomQuoteInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetRandomQuoteInteractor {
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getRandomQuote() -> Observable<[QouteModel]> {
        return self.repository.getRandomQuote()
    }
    
}
