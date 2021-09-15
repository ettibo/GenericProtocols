//
//  ViewController.swift
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let interactor = MainInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadModules()
    }
}
