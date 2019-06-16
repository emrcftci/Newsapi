//
//  DismissPopupAnimationHelper.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

class DismissPopupAnimationHelper: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to){
            toVC.view.tintAdjustmentMode = .normal
            toVC.view.isUserInteractionEnabled = true
            if let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) {
                
                var dimmingView: UIView?
                for subview in transitionContext.containerView.subviews {
                    if subview.layer.opacity < 1.0 {
                        dimmingView = subview
                        break
                    }
                }
                let duration = self.transitionDuration(using: transitionContext)
                let shrink = CGAffineTransform(scaleX: 0.8, y: 0.8)
                let translate = CGAffineTransform(translationX: 0.0, y: toVC.view.frame.size.height)
                UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: .calculationModeCubic, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                        fromVC.view.transform = shrink
                        dimmingView?.layer.opacity = 0.35
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                        fromVC.view.transform = shrink.concatenating(translate)
                        dimmingView?.layer.opacity = 0.0
                    })
                    
                }, completion: {
                    (finished:Bool) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                })
            }
            
        }
    }
    
    
}


