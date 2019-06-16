//
//  ResourcesInteractor.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol ResourcesBusinessLogic: class {
    func fetchResources(request: Resources.GetResources.RequestModel.Type)
}

protocol ResourcesDataStore: class {
    var sources: [Resources.GetResources.Source]? { get set }
    var selectedResourceId: String? { get set }
    var errorText: String? { get set }
}

class ResourcesInteractor: ResourcesBusinessLogic, ResourcesDataStore {
    
    var presenter: ResourcesPresentationLogic?
    var worker = ResourcesWorker()
    
    var sources: [Resources.GetResources.Source]?
    var selectedResourceId: String?
    var errorText: String?

    func fetchResources(request: Resources.GetResources.RequestModel.Type) {
        
        worker.getResources { [weak self] response in
            guard let self = self else { return }
            self.sources = response?.sources
            
            self.checkSourcesForAction()
        }
    }
}

// MARK: - Private Helpers

private extension ResourcesInteractor {
    func checkSourcesForAction() {
        
        if self.sources == nil {
            self.errorText = "Please check your connection."
            self.presenter?.presentFailureAlert()
            return
        }
        
        self.presenter?.presentReloadTableView()
    }
}
