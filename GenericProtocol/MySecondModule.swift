//
//  MySecondModule.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import Foundation

@objc
class MySecondModule: NSObject {
    
    func sayHello() {
        let name = String(describing: type(of: self))
        print("What's up? My name is \(name)")
    }
    
    func sayGoodBye() {
        let name = String(describing: type(of: self))
        print("See you, My name was \(name)")
    }
}
