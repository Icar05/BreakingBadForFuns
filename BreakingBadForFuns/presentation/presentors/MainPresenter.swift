//
//  MainPresenter.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import RxSwift
import SwiftUI
import Combine

class MainState: ObservableObject{
    @Published var quote: String = ""
    @Published var quoteAuthor: String = ""
    @Published var isLoading: Bool = false
}

class MainPresenter: ObservableObject{
    
    
    fileprivate let getRandomQuoteInteractor: GetRandomQuoteInteractor
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var cancellable: Set<AnyCancellable> = []
    
    var state = MainState()
    
    
    init(getRandomQuoteInteractor: GetRandomQuoteInteractor){
        self.getRandomQuoteInteractor = getRandomQuoteInteractor
        self.state
            .objectWillChange
            .receive(on: RunLoop.main)
            .sink{ [weak self] in self?.objectWillChange.send()}
            .store(in: &cancellable)
    }
    
    
    func getRandomQuote(){
       
        
        self.state.isLoading = true
        self.getRandomQuoteInteractor.getRandomQuote()
            .subscribe { model in
                self.state.quote = model.first!.quote
                self.state.quoteAuthor = model.first!.author
                self.state.isLoading = false
            } onError: { error in
                
                print("onError ... ")
                
                self.state.quote = error.localizedDescription
                self.state.isLoading = false
            }.disposed(by: disposeBag)
    }
    
    
}
