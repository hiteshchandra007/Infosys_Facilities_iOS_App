//
//  finalupdateViewController.swift
//  project
//
//  Created by gec on 25/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit
var z1:Int?
   var designationarray=["Trainee","Employee","HR"]
class finalupdateViewController: UIViewController,NSURLConnectionDataDelegate {
    
    var prev1:updateemployeeTableViewController?
    var tempDesigFlag = -1
    
    override func viewWillAppear(_ animated: Bool) {
        if tempDesigFlag == 1{
            desigLabelOutlet.isHidden = false
            designationOutlet.isHidden = false
        }else{
            desigLabelOutlet.isHidden = true
            designationOutlet.isHidden = true
        }
    }
 
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return designationarray.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return designationarray[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        z1=row
//    }
    
    func validatename(_ name:String)->Bool{
        let regex = "[A-Za-z]{3,20}"
        return NSPredicate(format: "SELF MATCHES %@",regex).evaluate(with:name)
    }
    func validateLastName(_ name:String)->Bool{
        let regex = "[A-Za-z ]{0,20}"
        return NSPredicate(format: "SELF MATCHES %@",regex).evaluate(with:name)
    }
    func validateContact(_ number:String)->Bool{
        let regex = "[6-9]\\d{9}"
        return NSPredicate(format: "SELF MATCHES %@",regex).evaluate(with:number)
    }
    

    func edit(){
//        print("edit called")
//        var asd=getData as? NSMutableDictionary
//        var rid=asd?.value(forKey: "userid") as? String
        
//        var array = [String]()
        var flag2 = 0
        if !validatename(firstnameOutlet.text!){
//            array.append("name")
            flag2 = 1
            alert(msg: "Invalid", info: "Please enter a valid FirstName", vc: self)
            
        }
        if !validateLastName(lastnameOutlet.text!){
//            array.append("lastname")
            alert(msg: "Invalid", info: "Please enter a valid LastName", vc: self)
            flag2 = 1
        }
        if !validateContact(contactOutlet.text!){
//            array.append("contact")
            alert(msg: "Inavalid", info: "Please enter a 10 digit contact number", vc: self)
            flag2 = 1
        }
        
        if flag2 == 0{
            let dict=NSMutableDictionary()
            dict.setValue(useridOutlet.text, forKey: "userid")
            dict.setValue(firstnameOutlet.text, forKey: "firstname")
            dict.setValue(lastnameOutlet.text, forKey: "lastname")
            dict.setValue(contactOutlet.text, forKey: "contact")
            if tempDesigFlag == 1{
                dict.setValue(designationOutlet.text, forKey: "designation")
            }else{
                dict.setValue(designationOutlet.text, forKey: "NA")
            }
            
            CustomConnection.toServer(dict, "updatedetails", self)
        }
        
    }
    
    
    
    @IBOutlet weak var useridOutlet: UILabel!
    
    @IBOutlet weak var desigLabelOutlet: UILabel!
    @IBOutlet weak var firstnameOutlet: UITextField!
    @IBOutlet weak var lastnameOutlet: UITextField!
    @IBOutlet weak var contactOutlet: UITextField!
    @IBOutlet weak var designationOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveaction(_ sender: UIButton) {
        edit()
        alert(msg: "Done!", info: "Saved Succesfully", vc: self)
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
