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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        let nibName = UINib(nibName: "AssignmentInfoViewCell", bundle: nil)
        assignmentTableView.registerNib(nibName, forCellReuseIdentifier: "AssignmentCell")
        
        let assignment1 = Assignment()
        let assignment2 = Assignment()
        let assignment3 = Assignment()
        
        assignment1.assignmentName = "Dummy Assignment 1"
        assignment2.assignmentName = "Dummy Assignment 2"
        assignment3.assignmentName = "Dummy Assignment 3"
        
        assignment1.dateAssigned = "11/3/15"
        
        
        assignment1.submitted = true
        assignment2.submitted = true
        assignment3.submitted = false
        
        assignment1.passing = true
        assignment2.passing = false
        assignment3.passing = true
        
        allAssignmentsCreated.append(assignment1)
        allAssignmentsCreated.append(assignment2)
        allAssignmentsCreated.append(assignment3)
        
        self.assignmentTableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: true)
        
        
    }
    
    
    
    
    
}


extension AssignmentsListViewController: UITableViewDelegate, UITableViewDataSource  {
 
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentCell", forIndexPath: indexPath) as! AssignmentTableViewCell
        cell.setCellDetails(allAssignmentsCreated[indexPath.row])
        
        return cell
    
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAssignmentsCreated.count
    }
    
    

}