//
//  ViewStudentsInClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/8/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class ViewStudentsInClassViewController: UIViewController {
    
    var classSelected: Classroom!
    
    @IBOutlet weak var studentsInClassTableView: UITableView!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        studentsInClassTableView.dataSource = self
        studentsInClassTableView.delegate = self

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "studentInClassNib", bundle: nil)
        studentsInClassTableView.registerNib(nib, forCellReuseIdentifier: "StudentsInClassCell")
        studentsInClassTableView.reloadData()
        print("view loaded")
    
    }

    
    

    
    

}

extension ViewStudentsInClassViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: Tableview datasource functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = studentsInClassTableView.dequeueReusableCellWithIdentifier("StudentsInClassCell") as! StudentInClassTableViewCell
        //MARK: Getting data to display from student
        let studentToDisplay: Student = classSelected.classRoster[indexPath.row]
        let studentFirstName: String = studentToDisplay.firstName
        let studentLastName: String = studentToDisplay.lastName
        let studentNumber: String = studentToDisplay.studentNumber
        let assignmentsCompleted: String = "\(studentToDisplay.assignments.count)"
        var assignmentsPassing: String {
            var passing = 0
            for assignment in studentToDisplay.assignments {
                if assignment.passing == true {
                    passing += 1
                }
            }
            return "\(passing)"
        }
        //MARK: Setting labels inside cell
        cell.studentNameLabel.text = "\(studentLastName), \(studentFirstName)"
        cell.studentNumberLabel.text = "Student Number:  \(studentNumber)"
        cell.assignmentsCompletedLabel.text = "Assignments Completed: " + assignmentsCompleted
        cell.assignmentsPassingLabel.text = "Assignments Passing: " + assignmentsPassing
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classSelected.classRoster.count
    }
    
    
}
