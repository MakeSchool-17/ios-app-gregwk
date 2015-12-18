//
//  AssignmentsListViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/30/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class AssignmentsListViewController: UIViewController{


    @IBOutlet weak var assignmentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentTableView.delegate = self
        assignmentTableView.dataSource = self
        
    }
    
    
    
    
    
}


extension AssignmentsListViewController: UITableViewDelegate, UITableViewDataSource  {
 
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as! AssignmentTableViewCell 
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle)
        
        cell.assignmentNameLabel.text = "Assignment \(indexPath.row)"
        cell.dateCreatedLabel.text = "\(timestamp)"
        
        return cell
    
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = IndividualAssignmentInfoViewController()
        presentViewController(vc, animated: true, completion: nil)
    }

}