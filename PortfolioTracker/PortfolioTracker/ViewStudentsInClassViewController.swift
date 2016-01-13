//
//  ViewStudentsInClassViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/8/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit
import Parse

class ViewStudentsInClassViewController: UIViewController {
    
    var classSelected: Classroom!
    
    var studentToView: Student!
    
    var studentsFromQuery: Array<Student>!
    
    
    
        
    
    
    
    @IBOutlet weak var studentsInClassTableView: UITableView!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        studentsInClassTableView.dataSource = self
        studentsInClassTableView.delegate = self

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "studentInClassNib", bundle: nil)
        studentsInClassTableView.registerNib(nib, forCellReuseIdentifier: "StudentsInClassCell")
        studentsInClassTableView.reloadData()
        print("view loaded")
        
        let query = PFQuery(className: "Student")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                print("retrieved \(objects!.count) students.")
                
                if let objects = objects {
                    for student in objects {
                        print("\(student)")
                    }
                    self.studentsFromQuery = objects as! Array<Student>
                    self.studentsInClassTableView.reloadData()
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowStudentsInClassSegue" {
            let nextVC = segue.destinationViewController as! StudentDetailViewController
            nextVC.studentSelected = studentToView
        }
    }

    
    

}

extension ViewStudentsInClassViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: Tableview datasource functions
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = studentsInClassTableView.dequeueReusableCellWithIdentifier("StudentsInClassCell") as! StudentInClassTableViewCell
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
        performSegueWithIdentifier("ShowStudentsInClassSegue", sender: nil)
    }
    
    
}
