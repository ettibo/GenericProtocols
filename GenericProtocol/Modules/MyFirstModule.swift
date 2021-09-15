//
//  MyFirstModule.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import Foundation

@objc
class MyFirstModule: NSObject {
    
    @objc func sayHello() {
        let name = String(describing: type(of: self))
        print("Hello My name is \(name)")
    }
    
    @objc func sayGoodBye() {
        let name = String(describing: type(of: self))
        print("GoodBye My name was \(name)")
    }
}
