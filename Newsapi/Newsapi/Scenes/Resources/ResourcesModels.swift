//
//  ResourcesModels.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum Resources {
    
    public enum GetResources {
        
        public struct Source: Codable {
            let id: String
            let name: String
            let url: String
            let description: String
        }
        
        public struct RequestModel: Codable {
            let status: String
            let sources: [Source]
        }
        
        struct Response {
            let sources: [Source]
        }
        
        struct ViewModel {
            let sources: [Source]
        }
        
    }
    
    enum GetNumberOfRows {
        struct Response {
            let numberOfRowsInSection: Int
        }
        
        struct ViewModel {
            let numberOfRowsInSection: Int
        }
    }
    
    enum SetSelectedId {
        struct Request {
            let indexPath: IndexPath
        }
    }
}
