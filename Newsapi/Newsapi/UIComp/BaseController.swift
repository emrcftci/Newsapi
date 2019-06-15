//
//  BaseController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
}

// MARK: - Private Helpers

private extension BaseController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .blue
    }
}
