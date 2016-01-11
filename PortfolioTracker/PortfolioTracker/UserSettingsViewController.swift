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
    
    let user = PFUser.currentUser()
    
    
    
    @IBOutlet weak var standardsPickerView: UIPickerView!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var currentStandardSelected: UILabel!
    
    @IBOutlet weak var successLabel: UILabel!
    
    
    
    var standardsSetChanged = false
    var newStandardsJurisdiction: String!
    
    
    @IBAction func changeStandardsButtonPressed(sender: AnyObject) {
        
        standardsPickerView.hidden = !standardsPickerView.hidden
        
    }
    
    @IBAction func saveChangesButtonPressed(sender: AnyObject) {
        
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let emailAddress = emailAddressTextField.text
        let schoolName = schoolNameTextField.text
        let newJurisdiction = newStandardsJurisdiction
        
        saveToParse(firstName!, lastName: lastName!, schoolName: schoolName!, emailAddress: emailAddress!, standards: newJurisdiction!)
        
        successLabel.hidden = false
        
        delay(1.0) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    let standardsPickerViewData = ["Please Select A Standards Set", "Common Core State Standards", "Oklahoma Academic Standards", "Texas Essential Knowledge and Skills", "Virginia State Standards of Learning", "Alaska State Standards", "Nebraska State Standards", "Indiana Academic Standards", "South Carolina CCR Standards"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        standardsPickerView.delegate = self
        standardsPickerView.dataSource = self
        
        
        if user != nil {
            firstNameTextField.text = user!["firstName"] as? String
            lastNameTextField.text = user!["lastName"] as? String
            emailAddressTextField.text = user!["emailAddress"] as? String
            schoolNameTextField.text = user!["schoolName"] as? String
            currentStandardSelected.text = user!["standardJurisdiction"] as? String
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
        newStandardsJurisdiction = standardsPickerViewData[row]
    }
    
    func saveToParse(firstName: String, lastName: String, schoolName: String, emailAddress: String, standards: String?) {
        
        if let user = PFUser.currentUser() {
            user["firstName"] = firstName
            user["lastName"] = lastName
            user["email"] = emailAddress
            user["schoolName"] = schoolName
            user["username"] = emailAddress
            if let newJurisdiction = self.newStandardsJurisdiction {
                user["standardsJurisdiction"] = newJurisdiction
                user.saveInBackgroundWithBlock(nil)
            }
        } else {
            print("Error.  User is nil")
        }
    }
}