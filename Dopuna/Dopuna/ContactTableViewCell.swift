//
//  ContactTableViewCell.swift
//  Dopuna
//
//  Created by Test on 21.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    //OUTLETS
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
