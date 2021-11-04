//
//  DetailView.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI



struct DetailView: View {
    
    
    let chocolates = ["Swimming", "Home", "Evanescence"]
    
    var body: some View {
        List {
            Section(footer: Footer()) {
                ForEach(chocolates, id: \.self) { chocolate in
                    NavigationLink(destination: TempView(chocolate: chocolate)){
                        Text(chocolate)
                    }
                }
            }.background(Color.red)
        }
        
    }
    
}

struct TempView: View{
    let chocolate: String
    var body: some View{
        Text(chocolate)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
