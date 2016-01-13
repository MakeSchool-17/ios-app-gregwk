////
////  Standard.swift
////  PortfolioTracker
////
////  Created by Mike Kane on 12/7/15.
////  Copyright © 2015 Mike Kane. All rights reserved.
////
//
import UIKit
import Foundation
import Parse

class Standard: PFObject, PFSubclassing {
    
    var shortCode: String!
    var descriptionOfStandard: String!
    var clarification: String!
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Standard"
    }

    func saveToParse() {
        let standard = PFObject(className: "Standard")
        standard["shortCode"] = shortCode
        standard[descriptionOfStandard] = "\(descriptionOfStandard)  Clarification:\(clarification)"
        
        standard.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if(success) {
                return
            } else {
                debugPrint(error?.description)
            }
        }
    }
    
    
}
