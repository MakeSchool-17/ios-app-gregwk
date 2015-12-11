//
//  SelectAssigneesViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/8/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class SelectAssigneesViewController: UIViewController {

    var studentOrClass: String!
    
    var tableView: UITableView!

    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
