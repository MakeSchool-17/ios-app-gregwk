//
//  ClassesViewController.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 11/23/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController {
    
    var allClasses: Array<Classroom> = []
    
    var cellSelectedIndex: Int!
    
    @IBAction func unwindToClassesVC(sender: UIStoryboardSegue) {
        
    }

    @IBOutlet weak var listOfClassesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "CurrentClassesTableView", bundle: nil)
        listOfClassesTableView.registerNib(nib, forCellReuseIdentifier: "CurrentClassesCell")
        
        listOfClassesTableView.dataSource = self
        listOfClassesTableView.delegate = self
        
    }

    override func viewWillAppear(animated: Bool) {
        let nib = UINib(nibName: "CurrentClassesTableView", bundle: nil)
        listOfClassesTableView.registerNib(nib, forCellReuseIdentifier: "CurrentClassesCell")
        listOfClassesTableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewStudentsInClassSegue" {
            let nextVC = segue.destinationViewController as! ViewStudentsInClassViewController
            nextVC.classSelected = allClasses[cellSelectedIndex]
        }
    }
    
}








extension ClassesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CurrentClassesCell") as! CurrentClassesTableViewCell
        cell.classNameLabel.text = allClasses[indexPath.row].className
        cell.studentsEnrolledLabel.text = "Students Enrolled: \(allClasses[indexPath.row].classRoster.count)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allClasses.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.cellSelectedIndex = indexPath.row
        performSegueWithIdentifier("ViewStudentsInClassSegue", sender: nil)
    }
    
    
    
}
