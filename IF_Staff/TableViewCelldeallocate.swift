//
//  TableViewCelldeallocate.swift
//  JDBCiOS
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class TableViewCelldeallocate: UITableViewCell {
    @IBOutlet var assignedtoOutlet: UILabel!
    

    
    @IBOutlet var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
