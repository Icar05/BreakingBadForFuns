//
//  TestView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var presenter: TestPresenter
    
    var body: some View {
        
        VStack{
            Text(presenter.state.data)
                .padding()
                .foregroundColor(presenter.state.state)
            Button("Load info"){
                presenter.getCharacterById(id: 1)
            }
            .foregroundColor(.black)
            .padding()
            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            ActivityIndicator(isAnimating: .constant(presenter.state.isLoading), mColor: .white, style: .large)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        return getViewBuilder().buildTestView()
    }
}


