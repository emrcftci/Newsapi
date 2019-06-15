//
//  ResourcesInteractor.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourcesBusinessLogic: class {

}

protocol ResourcesDataStore: class {

}

class ResourcesInteractor: ResourcesBusinessLogic, ResourcesDataStore {

    var presenter: ResourcesPresentationLogic?
    var worker = ResourcesWorker()

}
