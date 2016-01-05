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
    
    @IBOutlet weak var turnedInImage: UIImageView!
    
    @IBOutlet weak var passesStandardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellDetails(assignment: Assignment) {
        self.assignmentNameLabel.text = assignment.assignmentName
        self.dateCreatedLabel.text = assignment.dateAssigned
        if assignment.submitted == true {
            self.turnedInImage.image = UIImage(named: "GreenCheck.png")
            
            if assignment.passing == true {
                self.passesStandardImage.image = UIImage(named: "GreenCheck.png")
            } else {
                self.passesStandardImage.image = UIImage(named: "RedX.png")
            }
        } else {
            self.turnedInImage.image = UIImage(named: "RedX.png")
            self.passesStandardImage.image = UIImage(named: "RedX.png")
            }
        }
}


