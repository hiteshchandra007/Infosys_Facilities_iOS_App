//
//  EmployeeDetailsViewController.swift
//  Group2_Manager
//
//  Created by gec on 29/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class EmployeeDetailsViewController: UIViewController,NSURLConnectionDataDelegate {

    
    @IBOutlet weak var cabin: UILabel!
    @IBOutlet weak var cabinnumber: UILabel!
    @IBOutlet weak var requestDescr: UITextView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var floor: UILabel!
    @IBOutlet weak var roomnumber: UILabel!
    @IBOutlet weak var buildingnumber: UILabel!
    @IBOutlet weak var emailid: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var empname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       var p = ReallocateViewController.getUserCompData![0] as! NSMutableDictionary
        if (p.value(forKey: "eccnumber") as! String == "NA"){
            roomnumber.text = p.value(forKey: "roomnumber") as? String
        }else{
            roomnumber.text = p.value(forKey: "eccnumber") as? String
        }
        if (p.value(forKey: "cabinnumber") as? String == "NA"){
            cabinnumber.isHidden = true
            cabin.isHidden = true
        }else{
            cabinnumber.text = p.value(forKey: "cabinumber") as? String
        }
        /*CHANGED NOW*/
//        if (p.value(forKey: "category") as? String == "E"){
//            category.text = "Electrical"
//        }else if (p.value(forKey: "category") as? String == "S"){
//            category.text = "Stationary"
//        }else if (p.value(forKey: "category") as? String == "H"){
//            category.text = "Housing"
//        }
        category.text = p.value(forKey: "category") as? String
        empname.text = p.value(forKey: "firstname") as? String
        contact.text = String(p.value(forKey: "contact") as! Int64)
        designation.text = p.value(forKey: "designation") as? String
        emailid.text = p.value(forKey: "email") as? String
        buildingnumber.text = p.value(forKey: "buildingnumber") as! String
        floor.text = p.value(forKey: "floor") as? String
        requestDescr.text = p.value(forKey: "description") as? String
        
    }
 

}
