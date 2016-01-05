//
//  SelectStandardForAssignmentViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/8/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class SelectStandardForAssignmentViewController: UIViewController {
    
    //var applicableStandards: Array<Standard> = []
    
    @IBOutlet weak var standardSelectionTableView: UITableView!
    

    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    

    

}
