//
//  NetworkRequestParseUtil.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 10.10.2021.
//

import Foundation
import Alamofire


//data and error, and add closure



class NetworkRequestParseUtil{
    
    
    fileprivate let decoder = JSONDecoder()

    
    func parceCharacters(response: DataResponse<Any, AFError>) -> NetworkModel<[CharacterModel]>{
        switch response.result {
        case .success:
            do {
                let model = try self.decoder.decode([CharacterModel].self, from: response.data!)
                return NetworkModel(payload: model)
            } catch {
                return NetworkModel(error: error)
            }
        case .failure:
            return NetworkModel(error: response.error)
        }
    }
    
    
}
