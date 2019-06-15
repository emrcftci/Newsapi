//
//  ResourcesRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol ResourcesRoutingLogic: class {
    func routeToDetail()
}

protocol ResourcesDataPassing: class {
    var dataStore: ResourcesDataStore? { get }
}

final class ResourcesRouter: ResourcesRoutingLogic, ResourcesDataPassing {

    weak var viewController: ResourcesController?
    var dataStore: ResourcesDataStore?

    func routeToDetail() {
        let storyBoard = UIStoryboard(name: "ResourceDetail", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.ResourceDetailControllerIdentifier)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
