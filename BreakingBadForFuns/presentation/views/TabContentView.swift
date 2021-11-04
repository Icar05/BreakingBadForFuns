//
//  TabContentView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

import SwiftUI

struct TabContentView: View {
    
    
    private var category: MovieCategory
    
    private let viewBuilder = getViewBuilder()
    
    @Binding var quote: String
    
    @Binding var quoteAuthor: String
    
    @Binding var showLoading: Bool
    
    @State private var willMoveToEpisodes = false
    
    @State private var willMoveToCharacters = false
    
    
    init(withQuote: Binding<String>, withQuoteAuthor: Binding<String>, withShowProgress: Binding<Bool>, category: MovieCategory){
        self.category = category
        self._quote = withQuote
        self._quoteAuthor = withQuoteAuthor
        self._showLoading = withShowProgress
    }
    
    
    var body: some View {
        VStack() {
            
            VStack(spacing: 0) {
                Text($quote.wrappedValue)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                
                Text($quoteAuthor.wrappedValue)
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .italic()
                    .shadow(color: .black, radius: 3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .trailing)
                
                
                ActivityIndicator(isAnimating: .constant($showLoading.wrappedValue), mColor: UIColor.white, style: .large)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            
            
            
            
            VStack {
                Button("View episodes"){
                    willMoveToEpisodes = true
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.white)
                .border(Color.white, width: 2)
                .shadow(color: .black, radius: 3)
                .padding(.bottom, 10)
                
                Button("View characters"){
                    willMoveToCharacters = true
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.white)
                .border(Color.white, width: 2)
                .shadow(color: .black, radius: 3)
                
                NavigationLink(
                    destination: viewBuilder.buildEpisodesListView(category: category),
                    isActive: $willMoveToEpisodes
                ) {}
                
                NavigationLink(
                    destination: viewBuilder.buildCharactersListView(category: category),
                    isActive: $willMoveToCharacters
                ) {}
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .background(
            ZStack{
                category.getBackgroundImage()
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 5)
            }
        )
        .tabItem {
            Image("f")
            Text(category.toTitle())
        }
    }
    
    
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Text("")
    }
}



