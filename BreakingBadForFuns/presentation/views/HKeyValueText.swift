//
//  KeyValueText.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 02.11.2021.
//


import SwiftUI

struct HKeyValueText: View {
    
    let key: String
    let value: String
    var color: Color = Color.black
    
    var body: some View {
        HStack(alignment: .top){
            Text(key).font(Font.custom("AmericanTypewriter-Light", size: 18))
                .frame(alignment: .leading)
            Text(value).font(Font.custom("AmericanTypewriter", size: 15))
                .foregroundColor(color)
                .frame(alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
        .padding(.bottom, 5)
    }
}

struct HKeyValueText_Previews: PreviewProvider {
    
    static var previews: some View {
        return HKeyValueText(key: "Key",value: "Value")
    }
}


