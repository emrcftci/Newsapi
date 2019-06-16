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
        
        struct Source: Codable {
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
            
        }
        
        struct ViewModel {
            
        }
        
    }
}
