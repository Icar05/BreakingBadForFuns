//
//  EpisodesPresenter.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 26.10.2021.
//

import RxSwift
import SwiftUI
import Combine

struct Episodes: Hashable{
    let season: Int
    let episodes: [EpisodeModel]
}

class EpisodesState: ObservableObject{
    @Published var episodes: [Episodes] = []
    @Published var isLoading: Bool = false
}

class EpisodesPresenter: ObservableObject{
    
    
    fileprivate let interactor: GetEpisodesByCategoryInteractor
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var cancellable: Set<AnyCancellable> = []
    
    let state = EpisodesState()
    
    
    init(interactor: GetEpisodesByCategoryInteractor){
        self.interactor = interactor
        self.state
            .objectWillChange
            .receive(on: RunLoop.main)
            .sink{ [weak self] in self?.objectWillChange.send()}
            .store(in: &cancellable)
    }
    
    
    func getCharacters(category: MovieCategory){
        
        
        self.state.isLoading = true
        self.interactor.getEpisodesByCategory(category: category)
            .subscribe { model in
                self.state.episodes = self.prepareModels(models: model)
                self.state.isLoading = false
            } onError: { error in
                
                print("onError ... ")
                
                self.state.isLoading = false
            }.disposed(by: disposeBag)
    }
    
    
    private func prepareModels(models: [EpisodeModel]) -> [Episodes]{
        let dict = Dictionary(grouping: models, by: { $0.season!.trimmingCharacters(in: .whitespaces) })
        var res: [Episodes] = []
        
        for (key, values) in dict {
            let mod = Episodes(season: Int(key) ?? 0, episodes: values)
            res.append(mod)
        }
        
        return res.sorted {
            $0.season < $1.season
        }
    }
}
