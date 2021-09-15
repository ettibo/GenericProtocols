//
//  GenericProtocol.swift
//  GenericProtocol
//
//  Created by Thibaud on 09/04/2018.
//  Copyright © 2018 Tibo. All rights reserved.
//

import Foundation
import Gloss

struct GenericAction: Glossy {
    var method: String?
    var value: String?
    
    init?(json: JSON) {
        self.method = "func" <~~ json
        self.value = "value" <~~ json
    }
    
    func toJSON() -> JSON? {
        return nil
    }
}

struct GenericModule: Glossy {
    
    var name: String?
    var realObject: AnyObject?
    var actions: [GenericAction]?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        
        if let programmingObject = ObjectCreator.create(self.name) {
            self.realObject = programmingObject as AnyObject
        }
        
        self.actions = "actions" <~~ json
    }
    
    func toJSON() -> JSON? {
        return nil
    }
}
