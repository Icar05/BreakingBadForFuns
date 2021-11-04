//
//  ContentView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var characterPresenter: CharacterPresenter
    
    
    var body: some View {        
        
        VStack{
            Text(characterPresenter.data)
                .padding()
                .foregroundColor(characterPresenter.state)
            Button("Load info"){
                characterPresenter.getCharacterById(id: 1)
            }
            .foregroundColor(.black)
            .padding()
            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            ActivityIndicator(isAnimating: .constant(characterPresenter.isLoading), style: .large)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
//    static let router = getRouter()
    
    static var previews: some View {
        return Text("to fix")
    }
}
