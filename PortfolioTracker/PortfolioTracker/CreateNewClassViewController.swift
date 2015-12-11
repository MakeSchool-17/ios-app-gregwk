//
//  CreateNewClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/30/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class CreateNewClassViewController: UIViewController {

    @IBOutlet weak var classNameTextField: UITextField!
    
    @IBOutlet weak var subjectPickerView: UIPickerView!
    
    @IBOutlet weak var gradeLevelPickerView: UIPickerView!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        
    }
  

}
