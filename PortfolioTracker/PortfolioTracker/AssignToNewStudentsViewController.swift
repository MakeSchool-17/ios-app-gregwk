//
//  SelectStudentsViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/11/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class AssignToNewStudentsViewController: UIViewController {

    var classList: Array<Classroom>!
    var studentList: Array<Student>!
   
    @IBOutlet weak var newStudentsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newStudentsTableView.dataSource = self
        newStudentsTableView.delegate = self
        let nib = UINib(nibName: "StudentEnrolledCell", bundle: nil)
        newStudentsTableView.registerNib(nib, forCellReuseIdentifier: "StudentCell")
    }
    
    
    
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}





extension AssignToNewStudentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = newStudentsTableView.dequeueReusableCellWithIdentifier("StudentCell") as! StudentEnrolledTableViewCell
        
        return cell
    }
}
