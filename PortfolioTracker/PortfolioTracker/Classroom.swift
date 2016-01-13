//
//  Classroom.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/14/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Classroom: PFObject, PFSubclassing {
    
    var className: String!
    var gradeLevel: String!
    var subject: String!
    var classRoster: Array<Student> = []
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    func enrollStudent(student: Student) {
        if (isStudentEnrolled(student) == false) {
            self.classRoster.append(student)
        } else {
            //return error showing student already in class
        }
        
    }
    
    func isStudentEnrolled(studentToCheck: Student) -> Bool {
        for student in classRoster {
            if (student == studentToCheck) {
                return true
            }
        
        }
        return false
    }
    
    static func parseClassName() -> String {
        return "Class"
    }
}
