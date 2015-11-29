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
    
    @IBOutlet weak var userEmailTextField: UITextField?
    
    @IBOutlet weak var passwordTextField: UITextField?
    
    @IBOutlet weak var confirmPasswordTextField: UITextField?
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(sender: AnyObject) {

        let userName = userEmailTextField?.text
        let password = passwordTextField?.text
        let confirmedPassword = confirmPasswordTextField?.text
        
        if let userName = userName {  //check that email field is filled out
            
            //check that password fields are filled out, and that they match
            guard let password = password where password == confirmedPassword else {
                //if not, tell user
                print("passwords dont match")
                
                return
            }
            
                //everything is good, sign up
                signUp(userName, password: password)
                dismissViewControllerAnimated(true, completion: nil)
            
            
            
            //need to implement ability to tell
        }
    }
    
}




extension SignUpViewController {
    
    
    
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
    
        
}
    


