//
//  extension.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 23.10.2021.
//

import SwiftUI

extension PreviewProvider{
    static func getViewBuilder() -> SwiftUIViewBuilder{
        return (UIApplication.shared.delegate as! AppDelegate).getViewBuilder()
    }
}

extension View{
    static func getViewBuilder() -> SwiftUIViewBuilder{
        return (UIApplication.shared.delegate as! AppDelegate).getViewBuilder()
    }
}

extension SceneDelegate{
    func getViewBuilder() -> SwiftUIViewBuilder{
        return (UIApplication.shared.delegate as! AppDelegate).getViewBuilder()
    }
}

extension View {
    func hiddenNavigationBarStyle(title: String) -> some View {
        modifier( HiddenNavigationBar(title: title) )
    }
}

extension CharacterModel{
    func getColorForStatus()-> Color{
        guard let stat = status else {
            return Color.white
        }
        
        if(stat == "Alive"){
            return Color.green
        }else if(stat == "Deceased"){
            return Color.red
        }else{
            return Color.orange
        }
    }
}

extension View {
    func hide(value: Bool) -> some View{
        return self.opacity(value ? 1 : 0)
    }
}

extension Color {
    static let colorPaper = Color("ColorPaper")
}
