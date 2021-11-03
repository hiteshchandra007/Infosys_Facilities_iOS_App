//
//  ComplaintRequestDetailsViewController.swift
//  IF_Employee
//
//  Created by gec on 29/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ComplaintRequestDetailsViewController: UIViewController {
    var row4:Int?
    @IBOutlet var descriptionOutlet: UILabel!
    @IBOutlet var categoryOutlet: UILabel!
    @IBOutlet var employeeIDOutlet: UILabel!
    @IBOutlet var requestIDOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionOutlet.text = (getOpenData1[row4!] as! NSMutableDictionary).value(forKey: "description") as! String
        categoryOutlet.text = (getOpenData1[row4!] as! NSMutableDictionary).value(forKey: "category") as! String
        employeeIDOutlet.text = (getOpenData1[row4!] as! NSMutableDictionary).value(forKey: "userid") as! String
        requestIDOutlet.text = (getOpenData1[row4!] as! NSMutableDictionary).value(forKey: "requestid") as! String
        descriptionOutlet.numberOfLines = 0
        descriptionOutlet.sizeToFit()
        categoryOutlet.sizeToFit()
        employeeIDOutlet.sizeToFit()
        requestIDOutlet.sizeToFit()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
    }
    

 
}
