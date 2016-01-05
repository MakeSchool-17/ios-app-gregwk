//
//  CreateNewAssignmentViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/30/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

//get user input for name
//get user input for grade and subject level
//pass to next view controller

import UIKit


class CreateNewAssignmentViewController: UIViewController {

    
    @IBOutlet weak var assignmentNameTextLabel: UITextField!
    
    @IBOutlet weak var subjectPickerView: UIPickerView!
    
    @IBOutlet weak var gradeLevelPickerView: UIPickerView!
    
    var selectedSubject: String!
    var selectedGradeLevel: String!
    
    
    let subjectPickerViewData = ["All Subjects", "Math", "Reading", "History", "Science"]
    
    let gradeLevelPickerViewData = ["Kindergarten", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectPickerView.dataSource = self
        subjectPickerView.delegate = self
        gradeLevelPickerView.delegate = self
        gradeLevelPickerView.dataSource = self
    }

}

extension CreateNewAssignmentViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == subjectPickerView) {
            return subjectPickerViewData.count
        } else {
            return gradeLevelPickerViewData.count
        }
    }
    
    //MARK: Delegates
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == subjectPickerView) {
            return subjectPickerViewData[row]
        } else {
            return gradeLevelPickerViewData[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == subjectPickerView) {
            self.selectedSubject = subjectPickerViewData[row]
        } else {
            self.selectedGradeLevel = gradeLevelPickerViewData[row]
        }
    }
    
    
}