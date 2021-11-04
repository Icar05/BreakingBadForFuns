//
//  GetQuoteByIdInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetQuoteByIdInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getRandomQuote(id: Int) -> Observable<[QouteModel]> {
        return self.repository.getQuotesById(id: id)
    }
    
}
