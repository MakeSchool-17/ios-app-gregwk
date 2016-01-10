//
//  UserSettingsViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/6/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class UserSettingsViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var standardsPickerView: UIPickerView!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var schoolNameTextField: UITextField!
    
    var standardsSetChanged = false
    var newStandardsJurisdiction: String?
    
    @IBAction func changeStandardsButtonPressed(sender: AnyObject) {
        
        standardsPickerView.hidden = !standardsPickerView.hidden
        
    }
    
    
    
    
    
    let standardsPickerViewData = ["Please Select A Standards Set", "Common Core State Standards", "Oklahoma Academic Standards", "Texas Essential Knowledge and Skills", "Virginia State Standards of Learning", "Alaska State Standards", "Nebraska State Standards", "Indiana Academic Standards", "South Carolina CCR Standards"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    

}


extension UserSettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return standardsPickerViewData[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return standardsPickerViewData.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        standardsSetChanged = true
        
        
    }
    
    func saveToParse(firstName: String, lastName: String, schoolName: String, emailAddress: String, standards: String?) {
        
        if let user = PFUser.currentUser() {
            user["firstName"] = firstName
            user["lastName"] = lastName
            user["email"] = emailAddress
            user["schoolName"] = schoolName
            if let newJurisdiction = self.newStandardsJurisdiction {
                user["standardsJurisdiction"] = newJurisdiction
            }
        } else {
            
            print("Error.  User is nil")

        }
    }
    
}