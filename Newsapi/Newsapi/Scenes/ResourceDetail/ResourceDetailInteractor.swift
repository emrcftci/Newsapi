//
//  ResourceDetailInteractor.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourceDetailBusinessLogic: class {

}

protocol ResourceDetailDataStore: class {

}

class ResourceDetailInteractor: ResourceDetailBusinessLogic, ResourceDetailDataStore {

    var presenter: ResourceDetailPresentationLogic?
    var worker = ResourceDetailWorker()

}
