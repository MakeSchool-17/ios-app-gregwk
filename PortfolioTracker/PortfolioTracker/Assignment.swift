//
//  Assignment.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/14/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

//import Foundation
//import UIKit
//import Parse
//
//class Assignment: PFObject {
//    
//    var dateAssigned: String! = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle)
//    var standard: Standard!
//    var assignmentName: String!
//    var submitted: Bool = false
//    var passing: Bool = false
//    var studentWork: PFFile?
//    
//   
//    
//    func updateAssignmentDate() {
//        dateAssigned = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle)
//        
//    }
//    
//    func attachStudentWorkToAssignment() {
//        
//    }
//    
//    func saveToParse(){
//        let assignment = PFObject(className: "Assignment")
//        assignment["dateAssigned"] = self.dateAssigned
//        assignment["assignmentName"] = self.assignmentName
//        assignment["standard"] = self.standard
//        assignment["submitted"] = self.submitted
//        assignment["passing"] = self.passing
//        assignment["studentWork"]  = self.studentWork
//        
//    }
//}
