//
//  StudentInClassTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/8/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class StudentInClassTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var assignmentsCompletedLabel: UILabel!
    
    @IBOutlet weak var assignmentsPassingLabel: UILabel!
    
    @IBOutlet weak var studentNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
