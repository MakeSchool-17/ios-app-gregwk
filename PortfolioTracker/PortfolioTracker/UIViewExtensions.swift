//
//  File.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/10/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fadeIn() {
        UIView.animateWithDuration(3.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
}
