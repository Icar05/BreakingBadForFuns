//
//  TestPresenter.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI
import Combine
import RxSwift

struct DataState{
    static var sussess: Color  = Color.green
    static var error: Color = Color.red
    static var unknown: Color = Color.clear
}

class TestState: ObservableObject{
    @Published var data: String = ""
    @Published var state: Color = DataState.unknown
    @Published var isLoading: Bool = false
}

class TestPresenter: ObservableObject{
    
    
    fileprivate let getRandomQuoteInteractor: GetRandomQuoteInteractor
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var cancellable: Set<AnyCancellable> = []
    
    let state = TestState()
    
    
    init(getRandomQuoteInteractor: GetRandomQuoteInteractor){
        self.getRandomQuoteInteractor = getRandomQuoteInteractor
        self.state
            .objectWillChange
            .receive(on: RunLoop.main)
            .sink{ [weak self] in self?.objectWillChange.send()}
            .store(in: &cancellable)
    }
    
    
    func getCharacterById(id: Int){
        self.state.isLoading = true
        self.getRandomQuoteInteractor.getRandomQuote()
            .subscribe { model in
                self.state.isLoading = false
                self.state.data = model.first!.quote
                self.state.state = DataState.sussess
            } onError: { error in
                self.state.isLoading = false
                self.state.data = error.localizedDescription
                self.state.state = DataState.error
            }.disposed(by: disposeBag)
    }
    
    
}
