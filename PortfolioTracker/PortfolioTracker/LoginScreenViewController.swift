//
//  LoginScreenViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/23/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class LoginScreenViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField?
    
    @IBOutlet weak var passwordTextField: UITextField?
    
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        
        if let username = userNameTextField?.text where username != "" {
            if let password = passwordTextField?.text where password != "" {
                 login(username, password: password)
            } else {
                self.warningLabel.text = "The password field is empty!"
                self.warningLabel.hidden  = false
            }
        } else {
            self.warningLabel.text = "The username field is empty!"
            self.warningLabel.hidden = false
        }
    }
 
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        //performs modal segue to SignUpViewController
    }
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("forgotPasswordSegue", sender: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, -250), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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

extension LoginScreenViewController {
    
    
    
    func login(username: String, password: String) {
        let user = PFUser()
        user.username = username
        user.password = password
        
        PFUser.logInWithUsernameInBackground(user.username!, password: user.password!, block:{
            (user: PFUser?, error: NSError?) -> Void in
            
            if error == nil {
                dispatch_async(dispatch_get_main_queue()){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let dashboardVC: UIViewController = storyboard.instantiateViewControllerWithIdentifier("dashboardViewController")
                    self.presentViewController(dashboardVC, animated: true, completion: nil)
            }
            } else {
                print("login failed")
                self.warningLabel.text = "Invalid Login Credentials!"
                self.warningLabel.hidden = false
                self.delay(1.0){
                    self.warningLabel.hidden = true
                }
            }
    })
}

}

