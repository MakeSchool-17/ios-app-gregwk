//
//  IndividualAssignmentInfoViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/10/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class IndividualAssignmentInfoViewController: UIViewController  {

    var assignmentSelected: Assignment!
    
    var allStudents: [Student]!
    
    var studentsWithAssignment: [Student]!
    
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    @IBOutlet weak var standardCodeLabel: UILabel!
    
    @IBOutlet weak var studentsWithAssignmentTableview: UITableView!
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func editAssignmentButtonPressed(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateCreatedLabel.text = "Date Assigned: " + assignmentSelected.dateAssigned
        //standardCodeLabel.text = "Standard Attached: " + assignmentSelected.standard.shortCode
        
        let query = PFQuery(className: Student.parseClassName())
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects {
                    self.allStudents = objects as! [Student]
                    
                    for student in self.allStudents {
                        let assignments = student["assignments"] as! [Assignment]
                        if assignments.contains(self.assignmentSelected) {
                            self.studentsWithAssignment.append(student)
                        }
                    }
                    
                    self.studentsWithAssignmentTableview.reloadData()
                }
                
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddStudentsToAssignmentSegue" {
            let nextVC = segue.destinationViewController as! AssignToNewStudentsViewController
            nextVC.selectedAssignment = assignmentSelected
        }
    }
}


extension IndividualAssignmentInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("assignmentCell")! as! StudentsWithAssignmentTableViewCell
        let student = studentsWithAssignment[indexPath.row]
        let studentName = "\(student["lastName"]), \(student["firstName"])"
        let studentNumber = "\(student["studentNumber"])"
        cell.studentNameLabel.text = studentName
        cell.studentNumberLabel.text = studentNumber
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let studentList = studentsWithAssignment {
            return studentList.count
        } else {
            return 0
        }
    }
}
