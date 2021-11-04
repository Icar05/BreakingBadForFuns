//
//  CharCell.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 25.10.2021.
//

/**
 let charId: Int
 let name: String
 let birthday: String?
 let occupation: [String]?
 let img: String?
 let status: String?
 let nickname: String?
 let appearance: [Int]?
 let portrayed: String?
 let category: String?
 */
import SwiftUI

struct  CharCellView: View{
    
    var model: CharacterModel
    
    
    var body: some View {
        
        VStack{
            
            Text(model.name)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
            
            
            Text("(\(model.nickname ?? ""))")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.white)
                .italic()
                .shadow(color: .black, radius: 3)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
                .padding(.bottom)
            
            HStack{
                
                Text(model.birthday ?? "?")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
                
                Text(model.status ?? "?")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(model.getColorForStatus())
                    .shadow(color: .black, radius: 3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .trailing)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding()
        .background(Color.clear)
        .border(Color.white, width: 2)
        .padding(5)
    }
    
}

struct CharCellView_Previews: PreviewProvider {
    static var previews: some View {
        return getViewBuilder().buildCharactersListView(category: .BreakingBad)
    }
}




