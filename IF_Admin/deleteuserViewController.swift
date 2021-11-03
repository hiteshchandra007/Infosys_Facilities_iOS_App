//
//  deleteuserViewController.swift
//  project
//
//  Created by gec on 02/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class deleteuserViewController: UIViewController {
    var prev1:updateemployeeTableViewController?
    
    @IBOutlet weak var useridOutlet: UILabel!
    
    @IBOutlet weak var firstnameOutlet: UILabel!
    
    
    @IBOutlet weak var lastnameOutlet: UILabel!
    
    @IBOutlet weak var contactOutlet: UILabel!
    
    @IBOutlet weak var remarksOutlet: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func removeAction(_ sender: UIButton) {
        if remarksOutlet.text.count > 200{
            alert(msg: "Length of remarks cannot exceed 200 characters ", info: "", vc: self)
            remarksOutlet.text = ""
        }else{
            let dict = NSMutableDictionary()
            dict.setValue(useridOutlet.text, forKey: "userid")
            dict.setValue("N", forKey: "status")
            dict.setValue(remarksOutlet.text, forKey: "remarks")
            
            CustomConnection.toServer(dict, "removeUser1", self)
            alert(msg: "Done!", info: "Removed Succesfully", vc: self)
        }
        
        
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
