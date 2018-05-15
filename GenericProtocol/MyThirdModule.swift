//
//  MyThirdModule.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import Foundation
import UIKit

@objc
class MyThirdModule: NSObject {
    
    func openUrl(url: String) {
        let uri = URL(string: url)!
        UIApplication.shared.open(uri, options: [:], completionHandler: nil)
    }
}
