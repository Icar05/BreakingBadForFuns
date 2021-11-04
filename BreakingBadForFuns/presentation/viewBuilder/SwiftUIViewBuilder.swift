//
//  ViewBuilder.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI

class SwiftUIViewBuilder{
    
    fileprivate let component: Component
    
    init(component: Component){
        self.component = component
    }
    
    func buildEpisodesListView(category: MovieCategory) -> EpisodesListView {
        let presenter = component.getEpisodesPresenter()
        return EpisodesListView(category: category, presenter: presenter)
    }
    
    func buildCharactersListView(category: MovieCategory) -> CharactersListView{
        let presenter = component.getCharactersPresenter()
        return CharactersListView(category: category, presenter: presenter)
    }
    
    func buildTabView(withQuote: Binding<String>, withQuoteAuthor: Binding<String>, withShowProgress: Binding<Bool>, category: MovieCategory) -> TabContentView{
        return TabContentView(withQuote: withQuote, withQuoteAuthor: withQuoteAuthor, withShowProgress: withShowProgress, category: category)
    }
    
    func buildTestView() -> TestView{
        let testPresenter = component.getTestPresenter()
        return TestView(presenter: testPresenter)
    }
    
    func buildCharacterView(characterId: Int, category: MovieCategory) -> CharacterView{
        let presenter = component.getSingleCharacterPresenter()
        return CharacterView(id: characterId, category: category, presenter: presenter)
    }
    
    func buildMain() -> MainView{
        let mainPresenter = component.getMainPresenter()
        return MainView(presenter: mainPresenter)
    }
}
