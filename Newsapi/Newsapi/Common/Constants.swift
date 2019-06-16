//
//  Constants.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

enum Constants {
    
    // MARK: - All identifiers in project
    enum Identifiers {
        static let ResourceDetailControllerIdentifier = "ResourceDetailController"
        static let ResourcesControllerIdentifier = "ResourcesController"
        static let ResourcesCellIdentifier = "ResourcesCell"
        static let ResourceDetailCellIdentifier = "ResourceDetailCell"
    }
    
    // MARK: - Error messages
    
    enum ErrorMessages {
        static let ConnectionError = "Please check your connection."
    }
    
    // MARK: - Timer Properties
    
    enum TimerProperties {
        static let timerDuration = 60.0
    }
    
}
