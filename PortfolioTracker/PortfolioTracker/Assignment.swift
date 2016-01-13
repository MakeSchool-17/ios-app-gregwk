//
//  Assignment.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/14/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Assignment: PFObject, PFSubclassing {
    
    var dateAssigned: String! = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle)
    var standard: Standard!
    var assignmentName: String!
    var submitted: Bool = false
    var passing: Bool = false
    var studentWork: Array<UIImage> = []
    
   
    
    func updateAssignmentDate(newDate: String) {
        dateAssigned = newDate
        
    }
    
    func attachStudentWorkToAssignment(work: UIImage) {
        studentWork.append(work)
    }
    
    func toggleTurnedInStatus() {
        self.submitted = !self.submitted
    }
    
    func togglePassingStatus() {
        self.passing = !self.passing
    }
    
    func updateAssignmentName(newName: String) {
        self.assignmentName = newName
    }
    
    func saveToParse(){
        let assignment = PFObject(className: "Assignment")
        assignment["dateAssigned"] = self.dateAssigned
        assignment["assignmentName"] = self.assignmentName
        assignment["standard"] = self.standard
        assignment["submitted"] = self.submitted
        assignment["passing"] = self.passing
        assignment["studentWork"]  = self.studentWork
        
        assignment.saveInBackgroundWithBlock {
        (success: Bool, error: NSError?) -> Void in
            if(success) {
                return
            } else {
                debugPrint(error?.description)
            }
        }
    }
    
    
override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Assignment"
    }
    
}
