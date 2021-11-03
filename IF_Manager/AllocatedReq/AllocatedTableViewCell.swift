//
//  AllocatedTableViewCell.swift
//  Group2_Manager
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AllocatedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var staffIdOutlet: UILabel!
    @IBOutlet weak var reqidOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //insideView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
