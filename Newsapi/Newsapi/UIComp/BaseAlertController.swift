//
//  BaseAlertController.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit
import pop

public class BaseAlertController: UIViewController {
    private var swipeInteractionHelper:SwipeInteractionAnimationHelper?
}

// MARK: - Private Helpers

extension BaseAlertController: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        swipeInteractionHelper?.wireToVC(presented)
        return PresentPopupAnimationHelper()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissPopupAnimationHelper()
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if swipeInteractionHelper?.interactionInProgress ?? false {
            return swipeInteractionHelper
        }
        return nil
    }
}

// MARK: - SwipeInteractionAnimationHelperDelegate

extension BaseAlertController: SwipeInteractionAnimationHelperDelegate {
    
    func startDismissingVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func interactionDismissFinished() {
        //No need to implement anything
    }
}
