//
//  CurrentClassesTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/5/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class CurrentClassesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var classNameLabel: UILabel!
    
    @IBOutlet weak var studentsEnrolledLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
