//
//  TableViewCellallocate.swift
//  JDBCiOS
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class TableViewCellallocate: UITableViewCell {


    
    @IBOutlet var cellView: UIView!
    @IBOutlet var assignedToOutlet: UILabel!
    
    @IBOutlet var assignedByOutlet: UILabel!
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
