//
//  ComplaintsTableViewCell.swift
//  Group2_Manager
//
//  Created by gec on 29/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ComplaintsTableViewCell: UITableViewCell, NSURLConnectionDataDelegate {
    var serverData:Data?
    var selectedEmp : String?
    var q : NSMutableDictionary?
    var as1 : AddressTableViewController?
    var getData:NSMutableArray?
    var flag = 0
    @IBOutlet weak var insideView: UIView!
    
    @IBOutlet weak var complaintId: UILabel!
    
    @IBOutlet weak var compDescr: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.purple.cgColor
        self.layer.cornerRadius = 10
        insideView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
