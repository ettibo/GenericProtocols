//
//  BinderManager.swift
//  GooglePlacesSync
//
//  Created by Thibaud on 28/04/2017.
//  Copyright © 2017 Thibaud. All rights reserved.
//

import Foundation
import Gloss


class BinderManager {
    
    static func readValue<T: Glossy>(json: JSON, type: T.Type) -> T? {
        if let result = T.init(json: json) {
            return result
        }
        return nil
    }
    
    static func readValue<T: Glossy>(json: [JSON], type: T.Type) -> [T]? {
        if let result = [T].from(jsonArray: json) {
            return result
        }
        return nil
    }
}
