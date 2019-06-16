//
//  UIImage+Resize.swift
//  Newsapi
//
//  Created by Emre Çiftçi on 16.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
                _ in draw(in: CGRect(origin: .zero, size: canvas))
            }
        }
        
        return nil
    }
}
