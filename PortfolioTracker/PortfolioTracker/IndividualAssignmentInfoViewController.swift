//
//  IndividualAssignmentInfoViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/10/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class IndividualAssignmentInfoViewController: UIViewController  {

    var assignmentSelected: Assignment!
    
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
        standardCodeLabel.text = "Standard Attached: " + assignmentSelected.standard.shortCode
    }
}


extension IndividualAssignmentInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("assignmentCell")! as! StudentsWithAssignmentTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
