//
//  MainWorker.swift
//  GenericProtocol
//
//  Created by Thibaud HUCHON on 15/09/2021.
//  Copyright © 2021 Tibo. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

class MainWorker {
    func fetchModules(completionHandler: @escaping ([GenericProtocol]) -> Void) {
        let uri = "https://raw.githubusercontent.com/ettibo/GenericProtocols/master/Protocols.json"
        let completionHandlerHttp : (AFDataResponse<Any>) -> Void = { response in
            switch response.result {
            case .success:
                if let jsonArray = response.value as? [JSON] {
                    if let modules = BinderManager.readValue(json: jsonArray, type: GenericProtocol.self) {
                       completionHandler(modules)
                    }
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        AF.request(uri, method: .get, headers: nil).validate().responseJSON(completionHandler: completionHandlerHttp)
    }
}
