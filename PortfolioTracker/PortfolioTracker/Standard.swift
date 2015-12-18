////
////  Standard.swift
////  PortfolioTracker
////
////  Created by Mike Kane on 12/7/15.
////  Copyright © 2015 Mike Kane. All rights reserved.
////
//
//import UIKit
//import Gloss
//
//enum State: String {
//    case CommonCore
//    
//    case Oklahoma
//    
//    case Texas
//    
//    case Virginia
//    
//    case Alaska
//    
//    case Nebraska
//    
//    case Indiana
//    
//    case SouthCarolina
//    
//    case Minnesota
//    
//    
//}
//
//enum GradeLevel: String {
//    case Kindergarten = "Kindergarten"
//    
//    case G1 = "Grade 1"
//    
//    case G2 = "Grade 2"
//    
//    case G3 = "Grade 3"
//    
//    case G4 = "Grade 4"
//    
//    case G5 = "Grade 5"
//    
//    case G6 = "Grade 6"
//    
//    case G7 = "Grade 7"
//    
//    case G8 = "Grade 8"
//    
//    case G9 = "Grade 9"
//    
//    case G10 = "Grade 10"
//    
//    case G11 = "Grade 11"
//    
//    case G12 = "Grade 12"
//}
//
//enum Subject: String {
//    
//    case Reading = "English"
//    
//    case Math = "Math"
//    
//    case History = "History/Social Studies"
//    
//    case Science = "Science &amp; Technical Subjects"
//}
//
//
////struct Standard: Decodable {
////    
////    let state: State
////    let subject: Subject
////    let gradeLevel: GradeLevel
////    let shortCode: String?
////    let statement: String?
////    let clarifications: String?
////    
////    
////    init?(json: JSON) {
////        let stateString = "title" <~~ json
////        let subjectString = "subject" <~~ json
//////        let gradeLevelString = = ""
////        
////        switch stateString {
////            case "CCSS":
////                self.state =
////        }
////    }
////    
////}