//
//  SwipeInteractionAnimationHelper.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

protocol SwipeInteractionAnimationHelperDelegate: class {
    func startDismissingVC()
    func interactionDismissFinished()
}

class SwipeInteractionAnimationHelper: UIPercentDrivenInteractiveTransition {
    var interactionInProgress: Bool = false
    var shouldCompleteTransition: Bool = false
    weak var delegate: SwipeInteractionAnimationHelperDelegate?
    func wireToVC(_ viewController: UIViewController) {
        //no need to implement
    }
    
    func prepareGestureRecognizerInView(_ view: UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleGesture(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc internal func handleGesture(_ gesture: UIPanGestureRecognizer) {
        let cTranslation = gesture.translation(in: gesture.view)
        switch gesture.state {
        case .began:
            self.interactionInProgress = true
            self.delegate?.startDismissingVC()
        case .changed:
            var fraction = Float(cTranslation.y / 500.0)
            fraction = fminf(fmaxf(fraction, 0.0), 1.0)
            shouldCompleteTransition = (fraction > 0.35)
            self.update(CGFloat(fraction))
            
        case .ended, .cancelled:
            self.interactionInProgress = false
            if !shouldCompleteTransition || gesture.state == .cancelled {
                self.cancel()
            } else {
                self.finish()
                self.delegate?.interactionDismissFinished()
            }
            
        default:
            break
        }
    }
    
}

