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

enum State: String {
    case CommonCore
    case Oklahoma
    case Texas
    case Virginia
    case Alaska
    case Nebraska
    case Indiana
    case SouthCarolina
    case Minnesota
}

enum GradeLevel: String {
    case Kindergarten
    case G1
    case G2
    case G3
    case G4
    case G5
    case G6
    case G7
    case G8
    case G9
    case G10
    case G11
    case G12
}

enum Subject: String {
    case ELA
    case Math
    case History
    case Science
}

class Standard: PFObject {
    
    var shortCode: String!
    var descriptionOfStandard: String!
    var clarification: String!
    
}
