//
//  GetRandomQuoteByAuthorInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import RxSwift

class GetRandomQuoteByAuthorInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getRandomQuote(name: String) -> Observable<[QouteModel]>{
        return self.repository.getRandomQuoteByAuthor(name: name)
    }
}
