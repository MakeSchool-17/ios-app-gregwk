//
//  SelectStandardForAssignmentViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/8/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class SelectStandardForAssignmentViewController: UIViewController {
    
    let user = PFUser.currentUser()
    var commonCoreID: String!
    var allStandardsForJurisdiction: Dictionary<String, AnyObject>!
    
    var allApplicableStandards: Array<Standard> = []
    var standardSelected: Standard!
    
    var gradeLevel: String!
    var subjectSelected: String!
    var assignmentCreated: Assignment!
    
    @IBOutlet weak var standardSelectionTableView: UITableView!
    

    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        standardSelectionTableView.dataSource = self
        standardSelectionTableView.delegate = self
        
        
        let dummyStandard1 = Standard()
        let dummyStandard2 = Standard()
        let dummyStandard3 = Standard()
        let dummyStandard4 = Standard()
        let dummyStandard5 = Standard()
        
        dummyStandard1.shortCode = "1.2.1A"
        dummyStandard2.shortCode = "1.2.1B"
        dummyStandard3.shortCode = "1.2.2"
        dummyStandard4.shortCode = "2.1.2A"
        dummyStandard5.shortCode = "2.1.2B"
        
        dummyStandard1.descriptionOfStandard = "Understand the user of variables."
        dummyStandard2.descriptionOfStandard = "Use constansts correctly."
        dummyStandard3.descriptionOfStandard = "Use operators for basic computation."
        dummyStandard4.descriptionOfStandard = "Create a function that takes 1 input."
        dummyStandard5.descriptionOfStandard = "Demonstrate effective use of abstraction"
        
        allApplicableStandards.append(dummyStandard1)
        allApplicableStandards.append(dummyStandard2)
        allApplicableStandards.append(dummyStandard3)
        allApplicableStandards.append(dummyStandard4)
        allApplicableStandards.append(dummyStandard5)
        
        let nib = UINib(nibName: "SelectStandardNib", bundle: nil)
        standardSelectionTableView.registerNib(nib, forCellReuseIdentifier: "SelectStandardCell")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SelectAssigneesSegue" {
            let nextVC = segue.destinationViewController as! SelectAssigneesViewController
            nextVC.standardSelected = standardSelected
        }
    }

}





extension SelectStandardForAssignmentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = standardSelectionTableView.dequeueReusableCellWithIdentifier("SelectStandardCell") as! SelectStandardTableViewCell
        let standard = allApplicableStandards[indexPath.row]
        
        cell.shortCodeLabel.text = standard.shortCode
        cell.descriptionLabel.text = standard.descriptionOfStandard
        if let standardSelected = standardSelected {
            if standardSelected == standard {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allApplicableStandards.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        standardSelected = allApplicableStandards[indexPath.row]
        tableView.reloadData()
        
    }
    
}

