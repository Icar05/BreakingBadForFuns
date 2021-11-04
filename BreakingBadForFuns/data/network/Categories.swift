//
//  Categories.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 10.10.2021.
//

import SwiftUI


enum MovieCategory: String{
    case BreakingBad, BetterCallSaul
}

extension MovieCategory{
    func toRequest() -> String{
        return insertCharBetweenCases(input: self.rawValue, char: "+")
    }
    
    func toTitle() -> String{
        return insertCharBetweenCases(input: self.rawValue, char: " ")
    }
    
    func getBackgroundImage() -> Image{
        return Image(self.rawValue)
    }
}

func insertCharBetweenCases(input: String, char: String) -> String{
    var output = [Character]()
    for i in 0...input.count - 1 {
        
        if(i > 0 && input[i].isUppercase){
            
            for a in 0...char.count - 1 {
                output.append(char[a])
            }
            
            
        }
        
        output.append(input[i])
    }
    return String(output)
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
