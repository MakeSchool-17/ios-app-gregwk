//
//  StudentEnrolledTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/28/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import UIKit

class StudentEnrolledTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentNameLabel: UILabel!
    
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
