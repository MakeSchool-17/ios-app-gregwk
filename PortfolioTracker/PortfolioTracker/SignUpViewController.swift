//
//  SignUpViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/24/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var emailInputImage: UIImageView!
    @IBOutlet weak var passwordInputImage: UIImageView!
    @IBOutlet weak var confirmPasswordInputImage: UIImageView!
    @IBOutlet weak var firstNameInputImage: UIImageView!
    @IBOutlet weak var lastNameInputImage: UIImageView!
    @IBOutlet weak var schoolNameInputImage: UIImageView!
    @IBOutlet weak var standardsPickerView: UIPickerView!
    
    
    
    var emailInputValid: Bool = false
    var passwordInputValid: Bool = false
    var passwordConfirmed: Bool = false
    var firstNameInputValid: Bool = false
    var lastNameInputValid: Bool = false
    var schoolNameInputValid: Bool = false
    var didSelectJurisdiction: Bool = false
    var jurisdictionSelected: String = ""
    
    let standardsPickerViewData = ["Please Select A Standards Set", "Common Core State Standards", "Oklahoma Academic Standards", "Texas Essential Knowledge and Skills", "Virginia State Standards of Learning", "Alaska State Standards", "Nebraska State Standards", "Indiana Academic Standards", "South Carolina CCR Standards"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmailTextField?.delegate = self
        passwordTextField?.delegate = self
        confirmPasswordTextField?.delegate = self
        firstNameTextField?.delegate = self
        lastNameTextField?.delegate = self
        schoolNameTextField?.delegate = self
        standardsPickerView.dataSource = self
        standardsPickerView.delegate = self
    }
  
    
    
    
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        if (emailInputValid && passwordInputValid && passwordConfirmed && firstNameInputValid && lastNameInputValid && schoolNameInputValid && didSelectJurisdiction) {
            signUp(userEmailTextField.text!, password: passwordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, schoolName: schoolNameTextField.text!, jurisdiction: jurisdictionSelected)
            
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            resultsLabel.text = "All fields are required."
            resultsLabel.hidden = false
        }
    }
    
    
    
}
    





extension SignUpViewController: UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //MARK: Picker View Data Source
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return standardsPickerViewData.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return standardsPickerViewData[row]
    }
    
    
    //MARK: Picker View Delegate
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0 {
            self.jurisdictionSelected = standardsPickerViewData[row]
            self.didSelectJurisdiction = true
        } else {
            self.didSelectJurisdiction = false
        }
    }
    
    
    
    //MARK: Input Validation
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (textField == userEmailTextField) {
            
            if (isValidEmail(textField.text!)) {
                emailInputValid = true
            } else {
                emailInputValid = false
            }
             updateValidInputImage(emailInputValid, image: emailInputImage)
        }
        else if (textField == passwordTextField) {
            if (validateString(textField.text!)) {
                passwordInputValid = true
            } else {
                passwordInputValid = false
            }
              updateValidInputImage(passwordInputValid, image: passwordInputImage)
        }
        else if (textField == confirmPasswordTextField) {
            if (validateString(textField.text!) && passwordInputValid == true) {
                passwordConfirmed = true
            } else {
                passwordConfirmed = false
            }
                updateValidInputImage(passwordConfirmed, image: confirmPasswordInputImage)
        }
        else if (textField == firstNameTextField) {
            if (validateString(textField.text!)) {
                firstNameInputValid = true
            } else {
                firstNameInputValid = false
            }
                updateValidInputImage(firstNameInputValid, image: firstNameInputImage)
        }
        else if (textField == lastNameTextField) {
            if (validateString(textField.text!)) {
                lastNameInputValid = true
            } else {
                lastNameInputValid = false
            }
                updateValidInputImage(lastNameInputValid, image: lastNameInputImage)
        }
        else {
            if (validateString(textField.text!)) {
                schoolNameInputValid = true
            } else {
                schoolNameInputValid = false
            }
                updateValidInputImage(schoolNameInputValid, image: schoolNameInputImage)
            }
        return true
    }
        
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluateWithObject(testStr)
        
        return result
        
    }
    
    //MARK: Sign up through Parse
    func signUp(userName: String, password: String, firstName: String, lastName: String, schoolName: String, jurisdiction: String) {
        let server = Server()
        let user = PFUser()
        user.username = userName
        user.password = password
        user.email = userName
        user["firstName"] = firstName
        user["lastName"] = lastName
        user["schoolName"] = schoolName
        user["standardsJurisdiction"] = jurisdiction
        var selectedState: String = ""
        var selectedStateID: String = ""
        var allStandardsForState: Dictionary<String, AnyObject>!
        
        
        switch jurisdiction {
            case "Common Core State Standards":
                selectedState = "Common Core State Standards"
            case "Oklahoma Academic Standards":
                selectedState = "Oklahoma"
            case "Texas Essential Knowledge and Skills":
                selectedState = "Texas"
            case "Virgina State Standards of Learning":
                selectedState = "Virginia"
            case "Alaska State Standards":
                selectedState = "Alaska"
            case "Nebraska State Standards":
                selectedState = "Nebraska"
            case "Indiana State Standards":
                selectedState = "Indiana"
            case "South Carolina CCR Standards":
                selectedState = "South Carolina"
            default:
                selectedState = "Common Core State Standards"
        }
        
        server.getJurisdictionIDForState(selectedState) { (idForJurisdiction: String, returnStatus: ReturnStatus) in
            // we're inside the closure here!
            switch returnStatus {
            case .Successful:
                selectedStateID = idForJurisdiction
                //print("\(selectedStateID)")
                user["standardsJurisdictionID"] = selectedStateID
                
            case .Error:
                print("error getting ID")
            }
            
            
            server.getStandardsForJurisdiction(selectedStateID) { (standardsForJurisdiction: Dictionary<String, AnyObject>, returnStatus: ReturnStatus) -> Void in
                switch returnStatus {
                case .Successful:
                    allStandardsForState = standardsForJurisdiction
                    print("\(allStandardsForState)")
                    print("\n")
                    print("\n")
                    user["allStandardsForJurisdiction"] = [allStandardsForState]
                    
                    user.signUpInBackgroundWithBlock {
                        (succeeded: Bool, error: NSError?) -> Void in
                        if let error = error {
                            let errorString = error.userInfo[error] as? NSString
                            print(errorString)
                        }
                    }
                
                    
                    
                case .Error:
                    print("Error getting standards for \(selectedState)")
                }
            }
            
        }
        
        
        
        
    }
        
        
        
    
    
    func validateString(value: String?) -> Bool {
        if let value = value where value != "" {
            return true
        } else {
            return false
        }
    }
    
    func validateConfirmPassword(password: String?, passwordValidated: Bool, confirmPassword: String?) -> Bool {
        if passwordValidated == false {
            return false
        } else if password! != confirmPassword! {
            return false
        } else {
            return true
        }
    }
    
    //Mark: Update Image for input validation
    func updateValidInputImage(valid: Bool, image: UIImageView) {
        if (valid) {
            image.image = UIImage(named: "greenCheck.png")
        } else {
            image.image = UIImage(named: "redX.png")
        }
            image.hidden = false
    }



}

