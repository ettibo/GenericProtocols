//
//  ViewController.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getModules()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getModules() {
        let uri = "https://nofile.io/g/YTx1HiD1Zf7esVy6MsZxffQpOfMehnvuCXrkiRATh02RZECW0fjL0codoJMCrA0b/Protocols.json/"
        let completionHandlerHttp : (DataResponse<Any>) -> Void = { response in
            switch response.result {
            case .success:
                if let jsonArray = response.value as? [JSON] {
                    if let modules = BinderManager.readValue(json: jsonArray, type: GenericProtocol.self) {
                        self.useModules(modules: modules)
                    }
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
        Alamofire.request(uri, method: .get, headers: nil).validate().responseJSON(completionHandler: completionHandlerHttp)
    }
    
    func useModules(modules: [GenericProtocol]) {
        for module in modules {
            if let actions = module.actions {
                for action in actions {
                    if let method = action.method {
                        let selector = NSSelectorFromString(method)
                        if let obj = module.realObject, obj.responds(to: selector) {
                            if let value = action.value {
                                _ = obj.perform(selector, with: value)
                            } else {
                                _ = obj.perform(selector)
                            }
                        }
                    }
                }
            }
        }
    }
}
