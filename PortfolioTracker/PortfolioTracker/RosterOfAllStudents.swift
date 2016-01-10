//
//  RosterOfAllStudents.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/9/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import Foundation
import UIKit
import Parse

class RosterOfAllStudents: PFObject {
    
    static let totalRoster = RosterOfAllStudents()
    
    static var rosterOfAllStudents = PFObject(className: "RosterOfAllStudents")
    
    static var studentList: Array<Student> = []
    
    static func checkIfStudentEnrolled(student: Student) -> Bool {
        if studentList.contains(student) {
            return true
        } else {
            return false
        }
    }
    
   static func enrollStudent(student: Student) {
        if (checkIfStudentEnrolled(student) == false) {
            studentList.append(student)
            
        }
        
    }
    
    func saveToParse() {
        saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                
            } else {
                debugPrint(error?.description)
            }
        }
    }
    
}


extension RosterOfAllStudents: PFSubclassing {
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "RosterOfAllStudents"
    }
    
}