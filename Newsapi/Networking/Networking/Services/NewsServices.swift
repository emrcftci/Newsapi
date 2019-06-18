//
//  NewsServices.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum NewsServices: ServiceProtocol {
    
    case getSources
    case getTopHeadlines(source: String)
    
    public var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    public var apiKey: String {
        return "17dee2eb8eee461584226aceece35139"
    }
    
    public var path: String {
        switch self {
            
        case .getSources:
            return "/sources"
            
        case .getTopHeadlines(_):
            return "/top-headlines"
            
        }
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var task: Task {
        
        switch self {
            
        case .getSources:
            let parameters = ["apiKey": apiKey]
            return .requestParameters(parameters)
            
        case .getTopHeadlines(let sources):
            let parameters = ["sources": "\(sources)",
                              "apiKey": apiKey]
            return .requestParameters(parameters)
        }
    }
    
    public var headers: Headers? {
        return nil
    }
    
    public var parametersEncoding: ParametersEncoding {
        return .url
    }
}
