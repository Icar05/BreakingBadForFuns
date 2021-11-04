//
//  Modifier.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("\(title)", displayMode: .inline)
        .navigationBarHidden(true)
    }
}
