//
//  CreateStudentsForClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/10/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class CreateStudentsForClassViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
 
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var studentNumberTextField: UITextField!
    
    @IBOutlet weak var outcomeLabel: UILabel!
    
    @IBOutlet weak var firstNameValidImage: UIImageView!
    
    @IBOutlet weak var lastNameValidImage: UIImageView!
    
    @IBOutlet weak var studentNumberValidImage: UIImageView!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveStudentButtonPressed(sender: AnyObject) {
        let studentFirstName = firstNameTextField.text
        let studentLastName = lastNameTextField.text
        let studentNumber = studentNumberTextField.text
        
        if studentFirstName != "" && studentLastName != "" && studentNumber != "" {
            //save student profile to Realm and Parse
            outcomeLabel.textColor = UIColor.greenColor()
            outcomeLabel.text = "\(studentFirstName!) \(studentLastName!) added to class!"
            
        } else {
            outcomeLabel.textColor = UIColor.redColor()
            outcomeLabel.text = "Error: All Fields Required"
            
    
        }
        
        displayImages()
        outcomeLabel.hidden = false
        outcomeLabel.fadeOut()
        
        delay(3.1) {
            self.outcomeLabel.hidden = true
            self.outcomeLabel.alpha = 1.0
            self.firstNameValidImage.hidden = true
            self.firstNameValidImage.alpha = 1.0
            self.lastNameValidImage.hidden = true
            self.lastNameValidImage.alpha = 1.0
            self.studentNumberValidImage.hidden = true
            self.studentNumberValidImage.alpha = 1.0
        }
        
    }

    
    
    
    
}

extension CreateStudentsForClassViewController {
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func displayImages() {
        if firstNameTextField.text != "" {
            firstNameValidImage.image = UIImage(named: "greenCheck.png")
        } else {
            firstNameValidImage.image = UIImage(named: "redX.png")
        }
        
        if lastNameTextField.text != "" {
            lastNameValidImage.image = UIImage(named: "greenCheck.png")
        } else {
            lastNameValidImage.image = UIImage(named: "redX.png")
        }
        
        if studentNumberTextField.text != "" {
            studentNumberValidImage.image = UIImage(named: "greenCheck.png")
        } else {
            studentNumberValidImage.image = UIImage(named: "redX.png")
        }
        
        firstNameValidImage.hidden = false
        lastNameValidImage.hidden = false
        studentNumberValidImage.hidden = false
        
        firstNameValidImage.fadeOut()
        lastNameValidImage.fadeOut()
        studentNumberValidImage.fadeOut()
        
    }
        
}

