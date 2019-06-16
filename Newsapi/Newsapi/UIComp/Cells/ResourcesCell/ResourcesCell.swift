//
//  ResourcesCell.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

public class ResourcesCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

// MARK: Public Helpers

public extension ResourcesCell {
    func customize(with model: Resources.GetResources.Source) {
        titleLabel.text = model.name
        descriptionLabel.text = model.description
    }
}
