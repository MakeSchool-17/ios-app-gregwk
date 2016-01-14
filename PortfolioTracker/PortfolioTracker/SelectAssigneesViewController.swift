//
//  SelectAssigneesViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/8/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class SelectAssigneesViewController: UIViewController {

    var newAssignment: Assignment!

    var studentsSelected: Array<Student> = []
    
    var studentsFromQuery: Array<Student>!
    
    @IBOutlet weak var studentsTableView: UITableView!

    
    @IBAction func assignButtonPressed(sender: AnyObject) {
        
        newAssignment.saveInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            print("saved that dang assignment")
        }
        
        for student in studentsSelected {
            var assignments = student["assignments"] as! [Assignment]
            assignments.append(newAssignment)
            student["assignments"] = assignments
            student.saveInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
                print("saved that dang student")
            }
        }
        performSegueWithIdentifier("UnwindToAssignmentsSegue", sender: nil)
    }
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        
        let nib = UINib(nibName: "SelectAssigneesTableViewCellNib", bundle: nil)
        studentsTableView.registerNib(nib, forCellReuseIdentifier: "SelectAssigneesCell")
        
        let query = PFQuery(className: "Student")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                print("retrieved \(objects!.count) students.")
                
                if let objects = objects {
                    for student in objects {
                        print("\(student)")
                    }
                    self.studentsFromQuery = objects as! Array<Student>
                    self.studentsTableView.reloadData()
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UnwindToAssignmentsSegue" {
            let nextVC = segue.destinationViewController as! AssignmentsListViewController
            nextVC.allAssignmentsCreated.append(newAssignment)
            
        }
    }
    
}


extension SelectAssigneesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = studentsTableView.dequeueReusableCellWithIdentifier("SelectAssigneesCell") as! SelectAssigneesTableViewCell
        let student = studentsFromQuery[indexPath.row]
        cell.getCellDetails(student)
        if studentsSelected.contains(student) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentsFromQuery != nil {
            return studentsFromQuery.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if studentsFromQuery != nil {
            let student = studentsFromQuery[indexPath.row]
            if (studentsSelected.contains(student) == false) {
                studentsSelected.append(student)
            } else {
                let IndexOfStudentForRemoval = studentsSelected.indexOf(student)
                studentsSelected.removeAtIndex(IndexOfStudentForRemoval!)
            }
        }
        let index = [indexPath]
        studentsTableView.reloadRowsAtIndexPaths(index, withRowAnimation: UITableViewRowAnimation.None)
    }
    
    
}
