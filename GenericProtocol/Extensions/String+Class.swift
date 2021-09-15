//
//  String+Class.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import Foundation

import Foundation


extension String {
    func convertToClass<T>() -> T.Type? {
        return StringClassConverter<T>.convert(string: self)
    }
}

class StringClassConverter<T> {
    static func convert(string className: String) -> T.Type? {
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            return nil
        }
        guard let aClass: T.Type = NSClassFromString("\(nameSpace).\(className)") as? T.Type else {
            return nil
        }
        return aClass
    }
}
