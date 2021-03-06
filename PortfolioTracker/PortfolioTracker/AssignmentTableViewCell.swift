//
//  AssignmentTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/14/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit
import Foundation

class AssignmentTableViewCell: UITableViewCell {

    @IBOutlet weak var assignmentNameLabel: UILabel!
    
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellDetails(assignment: Assignment) {
        self.assignmentNameLabel.text = assignment["nameOfAssignment"] as? String
        self.dateCreatedLabel.text = assignment.dateAssigned
        
        }

}


