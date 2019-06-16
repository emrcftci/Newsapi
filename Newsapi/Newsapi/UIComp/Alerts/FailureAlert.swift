//
//  FailureAlert.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

public class FailureAlertController: BaseAlertController {
    
    public var titleText: String?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var alertTitleLabel: UILabel!
    
    // MARK: - View's Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupContentView()
        alertTitleLabel.text = titleText
        
    }
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Private Helpers

private extension FailureAlertController {
    func setupContentView() {
        contentView.layer.cornerRadius = 8
    }
}
