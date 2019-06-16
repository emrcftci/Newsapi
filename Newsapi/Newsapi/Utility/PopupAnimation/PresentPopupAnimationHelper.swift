//
//  PresentPopupAnimationHelper.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit
import pop

class PresentPopupAnimationHelper: NSObject, UIViewControllerAnimatedTransitioning {
    
    @objc func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    @objc func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view {
            fromView.tintAdjustmentMode = .dimmed
            fromView.isUserInteractionEnabled = false
            let dimmingView = UIView(frame: fromView.bounds)
            dimmingView.backgroundColor = UIColor(red: 58/255.0, green: 55/255.0, blue: 54/255.0, alpha: 1.0)
            dimmingView.layer.opacity = 0.0
            
            if let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view {
                toView.center = CGPoint(x: transitionContext.containerView.center.x, y: transitionContext.containerView.center.y + transitionContext.containerView.frame.size.height / 2)
                transitionContext.containerView.addSubview(dimmingView)
                transitionContext.containerView.addSubview(toView)
                let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
                positionAnimation?.toValue = transitionContext.containerView.center.y
                positionAnimation?.springBounciness = 10
                positionAnimation?.completionBlock = {
                    (anim: POPAnimation?, finished:Bool) in
                    transitionContext.completeTransition(true)
                }
                
                let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
                scaleAnimation?.springBounciness = 20
                scaleAnimation?.fromValue = NSValue(cgPoint: CGPoint(x: 1.2, y: 1.4))
                
                let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
                opacityAnimation?.toValue = 0.7
                
                toView.layer.pop_add(positionAnimation, forKey: "positionAnimation")
                toView.layer.pop_add(scaleAnimation, forKey: "scaleAnimation")
                dimmingView.layer.pop_add(opacityAnimation, forKey: "opacityAnimation")
            }
            
        }
        
    }
}


