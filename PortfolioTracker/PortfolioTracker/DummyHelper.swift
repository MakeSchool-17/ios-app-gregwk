//
//  CreateDummyData.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/12/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import Foundation

class DummyHelper {
    
    let firstNames = ["Steve", "Bob", "Mike", "Joey", "Billy", "Dan", "Mark", "Connor"]
    
    let lastNames = ["Smith", "Johnson", "Kane", "Brady", "Caldwell", "Gordon", "Costa"]
    
    let standardCodes = ["MA", "EU", "CD"]
    
    let x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    
    
    func createDummyStudent() -> Student {
        let student = Student()
        student.firstName = firstNames.randomItem()
        student.lastName = lastNames.randomItem()
        student.studentNumber  = "\(x.randomItem())\(x.randomItem())\(x.randomItem())\(x.randomItem())\(x.randomItem())\(x.randomItem()))"
        
        for _ in 1...8 {
            let assignment = createDummyAssignmentForStudent()
            student.assignments.append(assignment)
        }
        return student
    }
    
    func createDummyAssignmentForStudent() -> Assignment {
        let assignment = Assignment()
        assignment.standard = createDummyStandard()
        let y = x.randomItem()
        if y % 2 == 0 {
            assignment.submitted = true
            if y > 3 {
                assignment.passing = true
            } else {
                assignment.passing = false
            }
        } else {
            assignment.submitted = false
            assignment.passing = false
        }
        
        return assignment
    }
    
    func createDummyStandard() -> Standard {
        let standard = Standard()
        standard.shortCode = "\(standardCodes.randomItem()) \(x.randomItem()).\(x.randomItem()).\(x.randomItem())"
        standard.descriptionOfStandard = "fdskjl lksfd s;dfk ;as  ;kwe r;k sdf;k ;ekr"
        
        return standard
    }
    
    
}


extension Array {
    
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}