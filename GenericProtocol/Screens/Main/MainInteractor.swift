//
//  MainInteractor.swift
//  GenericProtocol
//
//  Created by Thibaud HUCHON on 15/09/2021.
//  Copyright © 2021 Tibo. All rights reserved.
//

import Foundation

class MainInteractor {
    let worker = MainWorker()
    
    func loadModules() {
        let completionHandler : ([GenericProtocol]) -> Void = { modules in
            ModuleRunner().useModules(modules: modules)
        }
        worker.fetchModules(completionHandler: completionHandler)
    }
}
