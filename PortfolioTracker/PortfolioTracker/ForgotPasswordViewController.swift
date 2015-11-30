//
//  ForgotPasswordViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/24/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class ForgotPasswordViewController: UIViewController {

   
    @IBOutlet weak var emailTextField: UITextField?
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        if let email = emailTextField?.text {
            if email != "" {
                forgotPassword()
                dismissViewControllerAnimated(true, completion: nil)
            }
            
        }
    
    }
    
    
    

}


extension ForgotPasswordViewController {
    
    func forgotPassword(){
        
        let userInput = emailTextField?.text
        let lowercaseEmail = userInput?.lowercaseString
        let emailToSubmit = lowercaseEmail?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        PFUser.requestPasswordResetForEmailInBackground(emailToSubmit!) {
            (success: Bool, error: NSError?) -> Void in
            if (error == nil) {
                let success = UIAlertController(title: "Success", message: "Success! Check your email for further instructions", preferredStyle: .Alert)
                let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                success.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(success, animated: true, completion: nil)
                
            })
            } else {
                
                let errorMessage = error?.userInfo["error"] as! NSString
                let error = UIAlertController(title: "Cannot Complete Request", message: errorMessage as String, preferredStyle: .Alert)
                let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                error.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(error, animated: true, completion: nil)
            })
        
        
        
            }
        
        
        }
    
    
    }

}