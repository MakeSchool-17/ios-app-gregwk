//
//  SelectStudentsViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/11/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class AssignToNewStudentsViewController: UIViewController {
    
    var selectedAssignment: Assignment!
    var newStudentsForAssignment: [Student]!
    var studentList: [Student]!
   
    @IBOutlet weak var newStudentsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newStudentsTableView.dataSource = self
        newStudentsTableView.delegate = self
        let nib = UINib(nibName: "SelectAssigneesTableViewCellNib", bundle: nil)
        newStudentsTableView.registerNib(nib, forCellReuseIdentifier: "StudentCell")
        
        let query = PFQuery(className: Student.parseClassName())
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects {
                    self.studentList = objects as! [Student]
                    self.newStudentsTableView.reloadData()
                }
                
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

        
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}



extension AssignToNewStudentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allStudents = studentList {
            return allStudents.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let student = studentList[indexPath.row]
        var assignments = student["assignments"] as! [Assignment]
        if (assignments.contains(selectedAssignment) == false) {
            assignments.append(selectedAssignment)
        } else {
            let assignmentIndex = assignments.indexOf(selectedAssignment)
            assignments.removeAtIndex(assignmentIndex!)
        }
        newStudentsTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = newStudentsTableView.dequeueReusableCellWithIdentifier("StudentCell") as! SelectAssigneesTableViewCell
        let student = studentList[indexPath.row]
        let studentName = "\(student["lastName"]), \(student["firstName"])"
        let studentNumber = "\(student["studentNumber"])"
        let assignments = student["assignments"] as! [Assignment]
        if assignments.contains(selectedAssignment) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        cell.studentNameLabel.text = studentName
        cell.studentNumberLabel.text = studentNumber
        
        return cell
    }
}
