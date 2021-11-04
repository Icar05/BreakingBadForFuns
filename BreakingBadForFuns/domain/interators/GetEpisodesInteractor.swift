//
//  GetEpisodes.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import RxSwift

class GetEpisodesInteractor{
    
    fileprivate let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getEpisodes() -> Observable<[EpisodeModel]> {
        return self.repository.getEpisodes()
    }
    
}
