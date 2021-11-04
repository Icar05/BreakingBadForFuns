//
//  CharactersListPresenter.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import SwiftUI
import RxSwift
import SwiftUI
import Combine

class CharactersState: ObservableObject{
    @Published var characters: [CharacterModel] = []
    @Published var isLoading: Bool = false
}

class CharactersListPresenter: ObservableObject{
    
    
    fileprivate let getCharactersInteractor: GetCharacterByCategoryInteractor
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var cancellable: Set<AnyCancellable> = []
    
    let state = CharactersState()
    
    
    init(getCharactersInteractor: GetCharacterByCategoryInteractor){
        self.getCharactersInteractor = getCharactersInteractor
        self.state
            .objectWillChange
            .receive(on: RunLoop.main)
            .sink{ [weak self] in self?.objectWillChange.send()}
            .store(in: &cancellable)
    }
    
    
    func getCharacters(category: MovieCategory){
       
        
        self.state.isLoading = true
        self.getCharactersInteractor.getCharacterByCategory(category: category)
            .subscribe { model in
                
                print("subscribe ... ")
                
                self.state.characters = model
                self.state.isLoading = false
            } onError: { error in
                
                print("onError ... ")
                
                self.state.isLoading = false
            }.disposed(by: disposeBag)
    }
    
    
}
