//
//  NetworkService.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import Foundation
import Alamofire
import RxSwift

typealias ConvertData = (_ response: DataResponse<Any, AFError>) throws -> Any

class NetworkService {
    
    let showLogs = true
        
    func loadRequest<T>(request: URLRequest, parceMethod: @escaping ConvertData) -> Observable<T> {
        return Observable.create{ observer in
            
            if(self.showLogs){
                print("request: \(request)")
            }
            
            
            let dataRequest = Session.default.request(request)
                .validate()
                .responseJSON { (response) in
                    
                    let string = String(decoding: response.data!, as: UTF8.self)
                    
                    if(self.showLogs){
                        print("response: \(string)")
                    }
                   
                    
                    switch response.result {
                    case .success:
                        do {
                            let model = try parceMethod(response)
                            observer.onNext(model as! T)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure:
                        observer.onError(response.error!)
                    }
                    
                    observer.onCompleted()
                }
            
            return Disposables.create {
                dataRequest.cancel()
            }
        }
    }
}
