//
//  NetworkModel.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 10.10.2021.
//

import Foundation

class NetworkModel<T>{
    
    
    fileprivate var isSuccess: Bool = false

    fileprivate var error: Error?

    fileprivate var payload: T?
    
    
    init(error: Error?) {
        self.error = error
        self.isSuccess = false
    }


    init(payload: T?) {
        self.payload = payload
        self.isSuccess = true
    }


    func isSuccessfull()->Bool{
        return isSuccess
    }


    func getError()-> Error?{
        return error
    }

    func getPayload() -> T?{
        return payload
    }
    
}
