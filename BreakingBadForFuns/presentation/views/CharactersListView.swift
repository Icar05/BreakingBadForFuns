//
//  CharactersListView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .listRowInsets(EdgeInsets())
    }
}

struct  CharactersListView: View{
    
    
    let builder = getViewBuilder()
    
    var category: MovieCategory
    
    @ObservedObject var presenter: CharactersListPresenter
    
    var body: some View {
        
        VStack{
            
            if(presenter.state.isLoading){
                VStack {
                    ActivityIndicator(isAnimating: .constant(presenter.state.isLoading), mColor: UIColor.white,style: .large)
                    
                }
                .frame(minWidth: 0, maxHeight: 400, alignment: .center)
            }
            ScrollView {
                Section(footer: Footer()) {
                    ForEach(presenter.state.characters, id: \.self) { char in
                        NavigationLink(destination: builder.buildCharacterView(characterId: char.charId, category: category)){
                            CharCellView(model: char)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(
            ZStack{
                category.getBackgroundImage()
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 5)
            })
        .onAppear(){
            presenter.getCharacters(category: category)
        }
        
        
    }
    
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        return getViewBuilder().buildCharactersListView(category: .BreakingBad)
    }
}



