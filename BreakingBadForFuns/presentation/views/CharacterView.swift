//
//  CharacterView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 26.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterView : View{
    
    
    var id: Int
    var category: MovieCategory
    
    @ObservedObject var presenter: CharacterPresenter
    
    var body: some View {
        
        VStack{
            
            if(presenter.state.isLoading){
                VStack {
                    ActivityIndicator(isAnimating: .constant(presenter.state.isLoading), mColor: UIColor.white,style: .large)
                    
                }
                .frame(minWidth: 0, maxHeight: 400, alignment: .center)
            } else{
                // body of dossier
                VStack{
                    
                    //main info
                    HStack(alignment: .top){
                        
                        //info
                        VStack{
                            VKeyValueText(key: "Name:", value: presenter.state.models.first?.name ?? "")
                            VKeyValueText(key: "Nickname:", value: presenter.state.models.first?.nickname ?? "")
                            VKeyValueText(key: "Birthday:", value: presenter.state.models.first?.birthday ?? "")
                            VKeyValueText(key: "Portrayed:", value: presenter.state.models.first?.portrayed ?? "")
                        }
                        .padding(5)
                        
                        //photo
                        VStack{
                            
                            if let imagePath = presenter.state.models.first?.img {
                                VStack{
                                    WebImage.init(url: URL(string: imagePath))
                                        .resizable()
                                        .placeholder {
                                            Rectangle().foregroundColor(.gray)
                                        }
                                        .indicator(.activity)
                                        .scaledToFit()
                                }
                            }
                        }
                        .padding(5)
                    }
                    
                    HKeyValueText(key: "Death count: ", value: "\(presenter.state.deathCount)").padding(5)
                    
                    if (!presenter.state.quote.isEmpty) {
                        HKeyValueText(key: "Quote: ", value: presenter.state.quote).padding(5)
                    }
                    
                    Text("\(presenter.state.models.first?.status ?? "")")
                        .padding(5)
                        .foregroundColor(presenter.state.statusColor)
                        .font(Font.custom("AmericanTypewriter", size: 40))
                        .background(Color.clear)
                        .border(presenter.state.statusColor, width: 2)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom, 50)
                        .rotationEffect(.degrees(-15))
                    
                }
                .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .top)
                .background(Color.colorPaper)
                .padding()
            }
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(
            
            ZStack{
                Image("wood")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            })
        
        .onAppear(){
            presenter.getCharacter(id: id)
        }
        
        
    }
    
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        return getViewBuilder().buildEpisodesListView(category: .BreakingBad)
    }
}





