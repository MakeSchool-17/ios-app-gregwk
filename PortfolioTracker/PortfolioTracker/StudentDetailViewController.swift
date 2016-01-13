//
//  StudentDetailViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/11/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    var studentSelected: Student!
    
    @IBOutlet weak var studentLabel: UILabel!
   
    @IBOutlet weak var studentAssignmentsTableView: UITableView!
    
    var assignmentToView: Assignment!
    
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        studentAssignmentsTableView.dataSource = self
        studentAssignmentsTableView.delegate = self
        let nib = UINib(nibName: "AssignmentInfoForStudentNib", bundle: nil)
        studentAssignmentsTableView.registerNib(nib, forCellReuseIdentifier: "StudentDetailCell")
        let studentFirstName = studentSelected.firstName
        let studentLastName = studentSelected.lastName
        studentLabel.text = "Student:  \(studentFirstName), \(studentLastName)"
        let assignment1 = Assignment()
        assignment1.passing = true
        assignment1.submitted = true
        assignment1.assignmentName = "Test Assignment"
        studentSelected.assignments.append(assignment1)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier ==  "ViewStudentAssignmentSegue" {
            let nextVC = segue.destinationViewController as! ViewStudentWorkForAssignmentViewController
            nextVC.assignmentSelected = assignmentToView
            nextVC.studentOwnsAssignment = studentSelected
        }
    }
}

extension StudentDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = studentAssignmentsTableView.dequeueReusableCellWithIdentifier("StudentDetailCell") as! AssignmentInforForStudentTableViewCell
        if studentSelected.assignments.count != 0 {
            let assignment  = studentSelected.assignments[indexPath.row]
            cell.assignmentNameLabel.text = assignment.assignmentName
            cell.dateAssignedLabel.text = assignment.dateAssigned
            if (assignment.passing == true) {
                cell.passesStandardImage.image = UIImage(named: "GreenCheck.png")
            } else {
                cell.passesStandardImage.image = UIImage(named: "RedX.png")
            }
            
            if (assignment.submitted == true) {
                cell.turnedInImage.image = UIImage(named: "GreenCheck.png")
            } else {
                cell.turnedInImage.image = UIImage(named: "RedX.png")
            }
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        assignmentToView = studentSelected.assignments[indexPath.row]
        performSegueWithIdentifier("ViewStudentAssignmentSegue", sender: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentSelected.assignments.count
    }
}
