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
        
        if let username = userNameTextField?.text where username != "" {
            if let password = passwordTextField?.text where password != "" {
                 login(username, password: password)
            } else {
                self.warningLabel.text = "The password field is empty!"
            }
        } else {
            self.warningLabel.text = "The username field is empty!"
        }
        
        
        
    }
   
 
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        //performs modal segue to SignUpViewController
    }
    
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        //performs modal segue to ForgotPasswordViewController
        //***NOTE: Still need to build ^^this^^ VC!***
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension LoginScreenViewController {
    
    func login(username: String, password: String) {
        let user = PFUser()
        //check optional status BEFORE this function is called!
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
            }
        
    })
}

}

