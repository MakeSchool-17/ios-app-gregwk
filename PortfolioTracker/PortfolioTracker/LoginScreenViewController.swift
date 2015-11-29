//
//  LoginScreenViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/23/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField?
    
    @IBOutlet weak var passwordTextField: UITextField?
    
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        
        let username = userNameTextField?.text
        let password = userNameTextField?.text
        
        if let username  = username, password = password {
            PFUser.logInWithUsernameInBackground(username, password: password) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    
                } else {
                    
                    self.warningLabel.text = "invalid login credentials"
                    self.warningLabel.hidden = false
                    
                }
            }
        } else {
            
            warningLabel.text = "fields are empty!"
            warningLabel.hidden = false
            
        }
        
    }
   
 
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
    }
    
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
