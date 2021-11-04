//
//  EpisodesListView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 26.10.2021.
//

import SwiftUI

struct EpisodesListView : View{
    
    
    var category: MovieCategory
    
    @ObservedObject var presenter: EpisodesPresenter
    
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
                    ForEach(presenter.state.episodes, id: \.self) { model in
                        Text("Season: \(model.season)")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment:
                                    .center)
                            .padding(5)
                            .background(Color.white.opacity(0.5))
                            .border(Color.white, width: 2)
                            .padding(5)
                        
                        ForEach(model.episodes, id: \.self) { epiModel in
                            EpiCellView(model: epiModel)
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

struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        return getViewBuilder().buildEpisodesListView(category: .BreakingBad)
    }
}




