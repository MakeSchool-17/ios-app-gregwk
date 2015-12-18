//
//  Classroom.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/14/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

//import Foundation
//import UIKit
//import Parse
//
//class Classroom: PFObject {
//    
//    var className: String!
//    var gradeLevel: String!
//    var subject: String!
//    var classRoster: Array<Student> = []
//    
//    
//    
//    func enrollStudent(student: Student) {
//        if (isStudentEnrolled(student) == false) {
//            self.classRoster.append(student)
//        } else {
//            //return error showing student already in class
//        }
//        
//    }
//    
//    func isStudentEnrolled(studentToCheck: Student) -> Bool {
//        for student in classRoster {
//            if (student == studentToCheck) {
//                return true
//            }
//        
//        }
//        return false
//    }
//    
//    
//    
//    
//}
