//
//  StudentOrClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/8/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class StudentOrClassViewController: UIViewController {
    
    var studentOrClass: String?
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func AssignByStudentButtonPressed(sender: AnyObject) {
        
        self.studentOrClass = "Student"
        self.performSegueWithIdentifier("SelectAssigneesSegue", sender: nil)
    }
   
    
    @IBAction func AssignByClassButtonPressed(sender: AnyObject) {
        
        self.studentOrClass = "Class"
        self.performSegueWithIdentifier("SelectAssigneesSegue", sender: nil)
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "SelectAssigneeSegues") {
            let nextVC = segue.destinationViewController as! SelectAssigneesViewController
            nextVC.studentOrClass = self.studentOrClass
        }
    }
}
