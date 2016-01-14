//
//  ViewStudentsInClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/8/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class StudentsDashBoardViewController: UIViewController {
    
    var studentToView: Student!
    
    var studentsFromQuery: [Student]!
    
    @IBOutlet weak var studentsInClassTableView: UITableView!
    
    @IBAction func unwindToStudentDashboard(sender: UIStoryboardSegue) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        studentsInClassTableView.dataSource = self
        studentsInClassTableView.delegate = self

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "studentInClassNib", bundle: nil)
        studentsInClassTableView.registerNib(nib, forCellReuseIdentifier: "StudentCell")
        studentsInClassTableView.reloadData()
        
        let query = PFQuery(className: Student.parseClassName())
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects {
                    self.studentsFromQuery = objects as! [Student]
                    self.studentsInClassTableView.reloadData()
                }
                
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowStudentAssignmentsSegue" {
            let nextVC = segue.destinationViewController as! StudentDetailViewController
            nextVC.studentSelected = self.studentToView
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if studentsFromQuery != nil && studentsFromQuery.count != 0 {
        studentsInClassTableView.reloadData()
        for student in studentsFromQuery {
            student.saveInBackground()
            }
        }
    }

}
extension StudentsDashBoardViewController: UITableViewDataSource, UITableViewDelegate {
   
    //MARK: Tableview datasource functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = studentsInClassTableView.dequeueReusableCellWithIdentifier("StudentCell") as! StudentInClassTableViewCell
        
        //MARK: Getting data to display from student
        if studentsFromQuery != nil {
        let studentToDisplay: Student = studentsFromQuery[indexPath.row]
        let studentFirstName = studentToDisplay["firstName"]
        let studentLastName = studentToDisplay["lastName"]
        let studentNumber = studentToDisplay["studentNumber"]
            
            //MARK: Setting labels inside cell
        cell.studentNameLabel.text = "\(studentLastName), \(studentFirstName)"
        cell.studentNumberLabel.text = "Student Number:  \(studentNumber)"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let studentList = studentsFromQuery {
                return studentList.count
        } else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        studentToView = studentsFromQuery[indexPath.row]
        performSegueWithIdentifier("ShowStudentAssignmentsSegue", sender: nil)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let studentToDelete = studentsFromQuery[indexPath.row]
            studentToDelete.deleteInBackground()
            let studentIndex = studentsFromQuery.indexOf(studentToDelete)
            studentsFromQuery.removeAtIndex(studentIndex!)
            studentsInClassTableView.reloadData()
        }
    }
    
}
