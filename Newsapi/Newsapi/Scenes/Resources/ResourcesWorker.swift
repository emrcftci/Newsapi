//
//  ResourcesWorker.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation
import Networking

final public class ResourcesWorker {
    private let sessionProvider = URLSessionProvider()
}

// MARK: - Public Helpers

public extension ResourcesWorker {
    func getResources(completion: @escaping ResourcesHandler) {
        sessionProvider.request(type: Resources.GetResources.RequestModel.self, service: NewsServices.getSources) { response in
            
            switch response {                
            case let .success(sources):
                completion(sources)
                
            case .failure(_):
                completion(nil)
            }
            
        }
    }
}
