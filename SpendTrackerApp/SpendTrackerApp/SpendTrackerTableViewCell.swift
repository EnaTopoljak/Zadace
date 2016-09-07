//
//  SpendTrackerTableViewCell.swift
//  SpendTrackerApp
//
//  Created by Test on 07.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class SpendTrackerTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
