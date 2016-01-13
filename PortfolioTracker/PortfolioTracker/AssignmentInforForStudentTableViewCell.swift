//
//  AssignmentInforForStudentTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/11/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class AssignmentInforForStudentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var assignmentNameLabel: UILabel!
    
    @IBOutlet weak var dateAssignedLabel: UILabel!
    
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

}
