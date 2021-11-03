//
//  ReallocateDetailsViewController.swift
//  Group2_Manager
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ReallocateDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var reqidLabel: UILabel!
    
    @IBOutlet weak var descrLabel: UITextView!
    @IBOutlet weak var staffIdLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var emplabel: UILabel!
    static var reqid = ""
    static var empid = ""
    static var descr = ""
    static var category = ""
    static var staffid = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        reqidLabel.text = ReallocateDetailsViewController.reqid
        emplabel.text = ReallocateDetailsViewController.empid
        categoryLabel.text = ReallocateDetailsViewController.category
        staffIdLabel.text = ReallocateDetailsViewController.staffid
        descrLabel.text = ReallocateDetailsViewController.descr
        
        
    }

}
