//
//  MainView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI

struct MainView : View {
    
    
    private let vb = getViewBuilder()
    
    @ObservedObject var presenter: MainPresenter
    
    @State private var selection = 0
    
    @State private var title =  MovieCategory.BreakingBad.rawValue
    
    
    var handler: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            self.updateTitle(selection: $0)
            self.selection = $0
        }
    )}
    
    @ViewBuilder
    var body: some View {
        
        NavigationView {
            TabView(selection: handler) {
                vb.buildTabView(
                    withQuote: $presenter.state.quote,
                    withQuoteAuthor: $presenter.state.quoteAuthor,
                    withShowProgress: $presenter.state.isLoading,
                    category: .BreakingBad)
                    .tag(0)
                
                vb.buildTabView(
                    withQuote: $presenter.state.quote,
                    withQuoteAuthor: $presenter.state.quoteAuthor,
                    withShowProgress: $presenter.state.isLoading,
                    category: .BetterCallSaul)
                    .tag(1)
            }
            .accentColor(Color.black)
            .navigationBarTitle("\($title.wrappedValue)", displayMode: .inline)
        }
        .accentColor(Color.black)
        .onAppear(){
            self.presenter.getRandomQuote()
            
            print("on Appear main")
        }
    }
    
    func updateTitle(selection: Int){
        let category = selection == 0 ? MovieCategory.BreakingBad : MovieCategory.BetterCallSaul
        self.title = category.toTitle()
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        return getViewBuilder().buildMain()
    }
}

