//
//  ModuleRunner.swift
//  GenericProtocol
//
//  Created by Thibaud HUCHON on 15/09/2021.
//  Copyright © 2021 Tibo. All rights reserved.
//

import Foundation

class ModuleRunner {
    func useModules(modules: [GenericModule]) {
        for module in modules {
            if let actions = module.actions {
                for action in actions {
                    if let object = module.realObject {
                        performAction(action: action, on: object)
                    }
                }
            }
        }
    }
    
    private func performAction(action: GenericAction, on object: AnyObject) {
        if let method = action.method {
            let selector = NSSelectorFromString(method)
            if object.responds(to: selector) {
                if let value = action.value {
                    _ = object.perform(selector, with: value)
                } else {
                    _ = object.perform(selector)
                }
            }
        }
    }
}
