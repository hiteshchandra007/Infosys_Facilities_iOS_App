//
//  empupdateTableViewCell.swift
//  project
//
//  Created by gec on 27/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class empupdateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var emplnameOutlet: UILabel!
    
    @IBOutlet weak var useridoutlet: UILabel!
    
    @IBOutlet weak var lastnameOutlet: UILabel!
    
    @IBOutlet weak var contactOutlet: UILabel!
    
    @IBOutlet weak var designationOutlet: UILabel!
    
    @IBOutlet weak var categoryOutlet: UILabel!
    
    @IBOutlet weak var designation: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
