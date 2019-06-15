//
//  ResourceDetailRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourceDetailRoutingLogic: class {
    func routeToSafari()
}

protocol ResourceDetailDataPassing: class {
    var dataStore: ResourceDetailDataStore? { get }
}

final class ResourceDetailRouter: ResourceDetailRoutingLogic, ResourceDetailDataPassing {

    weak var viewController: ResourceDetailController?
    var dataStore: ResourceDetailDataStore?

    func routeToSafari() {

    }
    
}

// MARK: - Private Helpers

private extension ResourceDetailRouter {
    func openSafari(with url: URL) {
        UIApplication.shared.open(url)
    }
}
