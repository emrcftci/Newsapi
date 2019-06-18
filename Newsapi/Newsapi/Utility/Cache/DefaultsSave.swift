//
//  DefaultsSave.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 18.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

protocol Saveable {
    func set(_ value: Any?, forKey defaultName: String)
    func remove(forKey defaultName: String)
    func object(forKey: String) -> Any?
}

class DefaultsSave: Saveable {
    private let defaults = UserDefaults.standard
    
    func set(_ value: Any?, forKey defaultName: String) {
        defaults.set(value, forKey: defaultName)
    }
    
    func remove(forKey defaultName: String) {
        defaults.removeObject(forKey: defaultName)
    }
    
    func object(forKey: String) -> Any? {
        return defaults.object(forKey: forKey)
    }
}
