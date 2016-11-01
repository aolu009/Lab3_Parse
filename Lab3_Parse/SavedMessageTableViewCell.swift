//
//  SavedMessageTableViewCell.swift
//  Lab3_Parse
//
//  Created by Lu Ao on 10/28/16.
//  Copyright © 2016 Lu Ao. All rights reserved.
//

import UIKit

class SavedMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var messageText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
