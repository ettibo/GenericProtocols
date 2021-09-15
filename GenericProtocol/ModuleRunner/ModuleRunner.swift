//
//  ModuleRunner.swift
//  GenericProtocol
//
//  Created by Thibaud HUCHON on 15/09/2021.
//  Copyright © 2021 Tibo. All rights reserved.
//

import Foundation

class ModuleRunner {
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
