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

    var standardSelected: Standard!
    
    var studentsSelected: Array<Student> = []
    
    var studentsFromQuery: Array<Student>!
    
    @IBOutlet weak var studentsTableView: UITableView!

    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func assignButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("UnwindToAssignmentsSegue", sender: nil)
        
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
            //nextVC.allAssignmentsCreated.append()
            
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
        studentsTableView.reloadData()
    }
    
    
}
