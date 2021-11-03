//
//  TableViewCellclosed.swift
//  JDBCiOS
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class TableViewCellclosed: UITableViewCell {

    
    @IBOutlet var cellView: UIView!
    @IBOutlet var assignedtoOutlet: UILabel!
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
