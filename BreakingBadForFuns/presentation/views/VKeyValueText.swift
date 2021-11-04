//
//  VKeyValueText.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 02.11.2021.
//

import SwiftUI

struct VKeyValueText: View {
    
    let key: String
    let value: String
    
    var body: some View {
            VStack{
                Text(key).font(Font.custom("AmericanTypewriter-Light", size: 18))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Text(value).font(Font.custom("AmericanTypewriter", size: 15))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
            .padding(.bottom, 5)
    }
}

struct VKeyValueText_Previews: PreviewProvider {
    
    static var previews: some View {
        return VKeyValueText(key: "Key",value: "Value")
    }
}

