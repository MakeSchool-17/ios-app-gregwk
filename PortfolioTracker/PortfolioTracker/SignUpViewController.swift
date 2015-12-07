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
    
    
    var emailInputValid: Bool = false
    var passwordInputValid: Bool = false
    var passwordConfirmed: Bool = false
    var firstNameInputValid: Bool = false
    var lastNameInputValid: Bool = false
    var schoolNameInputValid: Bool = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmailTextField?.delegate = self
        passwordTextField?.delegate = self
        confirmPasswordTextField?.delegate = self
        firstNameTextField?.delegate = self
        lastNameTextField?.delegate = self
        schoolNameTextField?.delegate = self
    }
  
    
    
    
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        if (emailInputValid && passwordInputValid && passwordConfirmed && firstNameInputValid && lastNameInputValid && schoolNameInputValid) {
            signUp(userEmailTextField.text!, password: passwordTextField.text!)
            saveUserDetails(firstNameTextField.text!, lastName: lastNameTextField.text!, schoolName: schoolNameTextField.text!)
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            resultsLabel.text = "All fields are required."
            resultsLabel.hidden = false
        }
    }
    
    
    
}
    





extension SignUpViewController: UITextFieldDelegate {
    
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
    
    
    func signUp(userName: String, password: String) {
        
        let user = PFUser()
        user.username = userName
        user.password = password
        user.email = userName
        
        
        user.signUpInBackgroundWithBlock{
            (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                let errorString = error.userInfo[error] as? NSString
                print(errorString)
                }
        }
    }
    
    
    
    func saveUserDetails(firstName: String, lastName: String, schoolName: String) {
        
        let user = PFObject(className: "User")
        user["firstName"] = firstName
        user["lastName"] = lastName
        user["schoolName"] = schoolName
        
        user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("attributes saved successfully")
            } else {
                print("\(error?.description)")
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

    func updateValidInputImage(valid: Bool, image: UIImageView) {
        if (valid) {
            image.image = UIImage(named: "greenCheck.png")
        } else {
            image.image = UIImage(named: "redX.png")
        }
            image.hidden = false
    }
}


