//
//  ResourcesRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourcesRoutingLogic: class {

}

protocol ResourcesDataPassing: class {
    var dataStore: ResourcesDataStore? { get }
}

final class ResourcesRouter: ResourcesRoutingLogic, ResourcesDataPassing {

    weak var viewController: ResourcesController?
    var dataStore: ResourcesDataStore?

}
