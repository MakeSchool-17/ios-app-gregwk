////
////  CreateNewClassViewController.swift
////  PortfolioTracker
////
////  Created by Mike Kane on 11/30/15.
////  Copyright © 2015 Mike Kane. All rights reserved.
////
//
//import UIKit
//import Parse
//
//class CreateNewClassViewController: UIViewController {
//    
//    let newClass = Classroom()
//    
//    let subjectPickerViewDataSource = ["All", "Math", "Reading/ELA", "History/Social Studies", "Science"]
//    
//    let gradeLevelPickerViewDataSource = ["Kindergarten", "1st Grade", "2nd Grade", "3d Grade", "4th Grade", "5th Grade", "6th Grade", "7th Grade", "8th Grade", "9th Grade", "10 Grade", "11th Grade", "12 Grade"]
//
//    @IBOutlet weak var classNameTextField: UITextField!
//    
//    @IBOutlet weak var subjectPickerView: UIPickerView!
//    
//    @IBOutlet weak var gradeLevelPickerView: UIPickerView!
//
//    
//    var subjectSelected: String!
//    var gradeLevelSelected: String!
//    
//    
//    @IBAction func backButtonPressed(sender: AnyObject) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    
//    @IBAction func continueButtonPressed(sender: AnyObject) {
//        
//        newClass.className = classNameTextField.text
//        newClass.subject = subjectSelected
//        newClass.gradeLevel = gradeLevelSelected
//        
//    }
//  
//    override func viewDidLoad() {
//        subjectPickerView.delegate = self
//        subjectPickerView.dataSource = self
//        gradeLevelPickerView.delegate = self
//        gradeLevelPickerView.dataSource = self
//    }
//    
//    
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "AddStudentsToClassSegue" {
//            let nextVC: CreateStudentsForClassViewController = segue.destinationViewController as! CreateStudentsForClassViewController
//            
//            nextVC.newlyCreatedClass = self.newClass
//            nextVC.newlyCreatedClass.className = self.classNameTextField.text
//            nextVC.newlyCreatedClass.gradeLevel = self.gradeLevelSelected
//            nextVC.newlyCreatedClass.subject = self.subjectSelected
//        }
//    }
//    
//    
//}
//
//extension CreateNewClassViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView == subjectPickerView {
//            return subjectPickerViewDataSource.count
//        } else {
//            return gradeLevelPickerViewDataSource.count
//        }
//    }
//    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == subjectPickerView {
//            return subjectPickerViewDataSource[row]
//        } else {
//            return gradeLevelPickerViewDataSource[row]
//        }
//    }
//    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == subjectPickerView {
//            self.subjectSelected = subjectPickerViewDataSource[row]
//        } else {
//            self.gradeLevelSelected = gradeLevelPickerViewDataSource[row]
//        }
//    }
//    
//}