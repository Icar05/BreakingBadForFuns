//
//  GetEpisodesByCategoryInteractor.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetEpisodesByCategoryInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getEpisodesByCategory(category: MovieCategory) -> Observable<[EpisodeModel]>{
        return self.repository.getEpisodesByCategory(category: category)
    }
    
}
