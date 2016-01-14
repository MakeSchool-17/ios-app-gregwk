//
//  AssignmentsListViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/30/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class AssignmentsListViewController: UIViewController {
    
    var allAssignmentsCreated: Array<Assignment> = []


    @IBOutlet weak var assignmentTableView: UITableView!
    var assignmentToView: Assignment!
    
    
    @IBAction func UnwindToAssignmentScreen(sender: UIStoryboardSegue) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        let nibName = UINib(nibName: "AssignmentInfoViewCell", bundle: nil)
        assignmentTableView.registerNib(nibName, forCellReuseIdentifier: "AssignmentCell")
        
       

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let query = PFQuery(className: "Assignment")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects {
                    self.allAssignmentsCreated = objects as! [Assignment]
                    self.assignmentTableView.reloadData()
                }
                
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewAssignmentDetailsSegue" {
            let nextVC = segue.destinationViewController as! IndividualAssignmentInfoViewController
            nextVC.assignmentSelected = assignmentToView
        }
    }
    
    
}


extension AssignmentsListViewController: UITableViewDelegate, UITableViewDataSource  {
 
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentCell", forIndexPath: indexPath) as! AssignmentTableViewCell
        let assignment = allAssignmentsCreated[indexPath.row]
        cell.setCellDetails(assignment)
        
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAssignmentsCreated.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        assignmentToView = allAssignmentsCreated[indexPath.row]
        performSegueWithIdentifier("ViewAssignmentDetailsSegue", sender: nil)
    }
    

}