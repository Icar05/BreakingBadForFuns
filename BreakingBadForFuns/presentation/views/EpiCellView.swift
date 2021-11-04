//
//  EpiCellView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 26.10.2021.
//

import SwiftUI

//let episodeId: Int
//let title: String
//let season: String?
//let episode: String?
//let airDate: String?
//let characters: [String]

struct  EpiCellView: View{
    
    var model: EpisodeModel
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text(model.title)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
                
                Text(model.airDate ?? "?")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .trailing)
            }
            
        
            Text("Season \(model.season ?? ""), episode: \(model.episode ?? "?")")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.white)
                .italic()
                .shadow(color: .black, radius: 3)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
                .padding(.bottom)
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding()
        .background(Color.clear)
        .border(Color.white, width: 2)
        .padding(5)
    }
    
}

struct EpiCellView_Previews: PreviewProvider {
    static var previews: some View {
        return getViewBuilder().buildCharactersListView(category: .BreakingBad)
    }
}





