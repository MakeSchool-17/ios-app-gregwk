//
//  SelectStandardTableViewCell.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 1/8/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import UIKit

class SelectStandardTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var shortCodeLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var standardSelectedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
