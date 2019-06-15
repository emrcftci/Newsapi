//
//  ResourceDetailRouter.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourceDetailRoutingLogic: class {

}

protocol ResourceDetailDataPassing: class {
    var dataStore: ResourceDetailDataStore? { get }
}

final class ResourceDetailRouter: ResourceDetailRoutingLogic, ResourceDetailDataPassing {

    weak var viewController: ResourceDetailController?
    var dataStore: ResourceDetailDataStore?

}
