//
//  AllocatedDetailsViewController.swift
//  Group2_Manager
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AllocatedDetailsViewController: UIViewController {
    var selectedItem = -1
    var generalAllocationStaffId = ""
    static var count = 0
    
    @IBOutlet weak var descrLabel: UITextView!
    
    @IBOutlet weak var staffId: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var empLabel: UILabel!
    @IBOutlet weak var requestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        if selectedItem != -1{
            let tempDict = AllocateRequestTableViewController.getData![selectedItem] as! NSMutableDictionary
            requestLabel.text = (tempDict.value(forKey: "reqid") as! String)
            requestLabel.sizeToFit()
            empLabel.text = (tempDict.value(forKey: "userid") as! String)
            empLabel.sizeToFit()
            categoryLabel.text = (tempDict.value(forKey: "category") as! String)
            categoryLabel.sizeToFit()
            descrLabel.text = tempDict.value(forKey: "Description") as! String
            descrLabel.sizeToFit()
            staffId.text = generalAllocationStaffId
            
        }
        
        
    }

   
    
}
