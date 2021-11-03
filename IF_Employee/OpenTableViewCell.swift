//
//  OpenTableViewCell.swift
//  IF_Employee
//
//  Created by gec on 29/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class OpenTableViewCell: UITableViewCell {

    @IBOutlet weak var seenImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        seenImage.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        seenImage.isHidden = false

        // Configure the view for the selected state
    }

}
