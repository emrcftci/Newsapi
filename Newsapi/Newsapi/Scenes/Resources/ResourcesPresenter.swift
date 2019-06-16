//
//  ResourcesPresenter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourcesPresentationLogic: class {
    func presentReloadTableView()
    func presentFailureAlert()
}

final class ResourcesPresenter: ResourcesPresentationLogic {

    weak var viewController: ResourcesDisplayLogic?
    
    func presentReloadTableView() {
        viewController?.displayReloadTableView()
    }
    
    func presentFailureAlert() {
        viewController?.displayFailureAlert()
    }
}
