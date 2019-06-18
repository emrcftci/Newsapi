//
//  File.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 18.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol Cachable: class {
    func saveObject<T: Codable & Identifiable>(with object: T, completion: @escaping BoolHandler)
    func deleteObject(with object: Identifiable, completion: @escaping VoidHandler)
    func checkObject(with object: Identifiable, completion: @escaping BoolHandler)
}

protocol Identifiable {
    var publishedAt: String? { get set }
}

class Cache: Cachable {
    
    static let shared = Cache()
    
    private var saveable: Saveable!
    private let encoder = JSONEncoder()
    
    init(saveable: Saveable = DefaultsSave()) {
        self.saveable = saveable
    }
    
    func saveObject<T: Codable & Identifiable>(with object: T, completion: @escaping BoolHandler) {
        if let encoded = try? encoder.encode(object) {
            saveable.set(encoded, forKey: object.publishedAt ?? "")
            completion(true)
            return
        }
        completion(false)
    }
    
    func deleteObject(with object: Identifiable, completion: @escaping VoidHandler) {
        saveable.remove(forKey: object.publishedAt ?? "")
        completion()
    }
    
    func checkObject(with object: Identifiable, completion: @escaping BoolHandler) {
        if saveable.object(forKey: object.publishedAt ?? "") != nil {
            completion(true)
            return
        }
        completion(false)
    }
    
}
