//
//  SelectAssigneesTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/13/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class SelectAssigneesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var studentNumberLabel: UILabel!
    
    func getCellDetails(student: Student) {
        let studentFirstName = student["firstName"]
        let studentLastName = student["lastName"]
        let studentNumber = student["studentNumber"]
        
        studentNameLabel.text = "\(studentLastName), \(studentFirstName)"
        studentNumberLabel.text = "\(studentNumber)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
