//
//  CharacterPresenter.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 26.10.2021.
//

import SwiftUI
import RxSwift
import Combine


class CharacterState: ObservableObject{
    @Published var models: [CharacterModel] = []
    @Published var isLoading: Bool = false
    @Published var quote: String = ""
    @Published var deathCount: Int = 0
    @Published var statusColor: Color = Color.black
}

class CharacterPresenter: ObservableObject{
    
    
    fileprivate let interactor: GetCharacterByIdInteractor
    
    fileprivate let anotherInteractor: GetRandomQuoteByAuthorInteractor
    
    fileprivate let deathCountInteractor: GetDeathCountInteractor
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var cancellable: Set<AnyCancellable> = []
    
    let state = CharacterState()
    
    
    init(interactor: GetCharacterByIdInteractor, int: GetRandomQuoteByAuthorInteractor, dcInt: GetDeathCountInteractor){
        self.interactor = interactor
        self.anotherInteractor = int
        self.deathCountInteractor = dcInt
        self.state
            .objectWillChange
            .receive(on: RunLoop.main)
            .sink{ [weak self] in self?.objectWillChange.send()}
            .store(in: &cancellable)
    }
    
    
    func getCharacter(id: Int){
        
        self.state.isLoading = true
        self.interactor.getCharacter(id: id)
            .subscribe { model in
                self.state.models = model
                self.state.isLoading = false
                self.loadQuote(author: model.first!.name)
                self.loadDeathCount(author: model.first!.name)
                self.state.statusColor = model.first!.getColorForStatus()
            } onError: { error in
                self.state.isLoading = false
            }.disposed(by: disposeBag)
    }
    
    func loadQuote(author: String){
        let queryAuthor = author.replacingOccurrences(of: " ", with: "+")
        self.anotherInteractor.getRandomQuote(name: queryAuthor).subscribe { model in
            self.state.quote = model.first?.quote ?? ""
        } onError: { error in
            print("error while request Quote: \(error)")
        }.disposed(by: disposeBag)
    }
    
    func loadDeathCount(author: String){
        let queryAuthor = author.replacingOccurrences(of: " ", with: "+")
        self.deathCountInteractor.getDeathCount(name: queryAuthor).subscribe { model in
            self.state.deathCount = model.first!.deathCount
        }  onError: { error in
            print("error while request Death Count: \(error)")
        }.disposed(by: disposeBag)
    }
}

