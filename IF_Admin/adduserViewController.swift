//
//  adduserViewController.swift
//  project
//
//  Created by gec on 25/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit
var y:String?
var y1:String?
var des : String? = "NA"
var cat:String?
var eid = 1000
var sid = 1000
var mid = 1000
var email:String?
var tempStaff : String? = "NA"
var tempStaffAva = "NA"
class adduserViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,NSURLConnectionDataDelegate {
    @IBOutlet weak var staffSegment: UISegmentedControl!
    var serverData:Data?
    var countFlag = 0
    var designation=["Trainee","Employee","HR"]
    var category=["Housekeeping","Electrical","Stationary"]
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var lastnameOutlet: UITextField!
    @IBOutlet weak var contactOutlet: UITextField!
    @IBOutlet weak var desiglabel: UILabel!
    @IBOutlet weak var deigantionOutlet: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        deigantionOutlet.delegate=self
        deigantionOutlet.dataSource=self
        staffSegment.isHidden = true
       // view.backgroundColor?.cgColor=UIColor.black
       
        
    }
    var recArray:NSMutableArray?
    override func viewWillAppear(_ animated: Bool) {
//        countFlag = 1
//        let dict = NSMutableDictionary()
//        CustomConnection.toServer(dict, "getCount", self)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return designation.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return designation[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var selectedrow=row
        if component == 0{
        if selectedrow == 0{
            des="Trainee"
        }
        if selectedrow == 1{
            des="Employee"
        }
        if selectedrow == 2{
            des="HR"
        }
        print(des!)
        }
    }
    func validatename(_ name:String)->Bool{
        let regex = "[A-Za-z ]{3,20}"
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
    

    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
         alert100(vc: self)
    }
    @IBAction func roleAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
        y="E"
            tempStaff = "NA"
            tempStaffAva = "NA"
            des="Trainee"
        deigantionOutlet.isHidden = false
        desiglabel.isHidden = false
            staffSegment.isHidden = true
            eid = eid + 1
            y1 = y!+String(eid)
        }
        if sender.selectedSegmentIndex == 1{
            y="S"
            staffSegment.isHidden = false
            tempStaff = "Housekeeping"
            des = "NA"
            print("Hello I am Here",category[staffSegment.selectedSegmentIndex])
            tempStaffAva = "Available"
            deigantionOutlet.isHidden = true
            desiglabel.isHidden = true
            sid = sid + 1
            y1 = y!+String(sid)
        }
        if sender.selectedSegmentIndex == 2{
            y="M"
            des = "NA"
            tempStaff = "NA"
            tempStaffAva = "NA"
            staffSegment.isHidden = true
            deigantionOutlet.isHidden = true
                desiglabel.isHidden = true
            mid = mid + 1
             y1 = y!+String(mid)
            }
            print(y!)
        }
    
    
    @IBAction func staffCategoryAction(_ sender: UISegmentedControl) {
        print("Hello Iam Here",category[staffSegment.selectedSegmentIndex])
        tempStaff = category[staffSegment.selectedSegmentIndex]
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func AddAction(_ sender: UIButton) {
        
       email = nameOutlet.text! + "_" + lastnameOutlet.text! + "@infosys.com"
        var array = [String]()
        var message = ""
        if !validatename(nameOutlet.text!){
            array.append("name")
            alert(msg: "Invalid name", info: "Please enter minimum three characters name and it should contain only alphabets", vc: self)
        }
        if !validateLastName(lastnameOutlet.text!){
            array.append("lastname")
            alert(msg: "Invalid lastname", info: "Please enter minimum three characters name and it should contain only alphabets", vc: self)
        }
        if !validateContact(contactOutlet.text!){
            array.append("contact")
            alert(msg: "Invalid contact", info: "Please enter minimum ten digits and it should start from 6/7/8/9", vc: self)
        }
        for i in array{
            message+=" "+i
        }
        if array.count>0{
            alert(msg: "Please,enter valid credentials for following details", info: message, vc: self)
        }else{
            let dict = NSMutableDictionary()
            dict.setValue(nameOutlet.text, forKey: "firstname")
            dict.setValue(lastnameOutlet.text, forKey: "lastname")
            dict.setValue(contactOutlet.text, forKey: "contact")
            dict.setValue(des, forKey: "designation")
            dict.setValue(y, forKey: "role")
            dict.setValue("0", forKey: "empcounter")
            dict.setValue("0", forKey: "staffcounter")
            dict.setValue("0", forKey: "managercounter")
            dict.setValue(email, forKey: "email")
            //dict.setValue(y1, forKey: "userid")
            dict.setValue("infy@123", forKey: "password")
            dict.setValue("A", forKey: "status")
            dict.setValue("NA", forKey: "remarks")
            dict.setValue(tempStaff, forKey: "category")
            dict.setValue(tempStaffAva, forKey: "staffstatus")
            dict.setValue("0", forKey: "allcount")
        
        
        
        
        
        
       
//        alert(msg: "Successfully generated User id, Email-ID, password", info: y1! + " " +  "Infy@123" + email!, vc: self)
        //autoVC?.welcomeOutlet.text=nameOutlet.text

        CustomConnection.toServer(dict, "adduser", self)
        }
    }
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        var check = ""
        
        check = String.init(data: data, encoding: .ascii)!
        if  check == "Done"{
            nameOutlet.text = ""
            lastnameOutlet.text = ""
            contactOutlet.text = ""
            
            alert1(msg: "Success", info: "Data added succesfully", vc: self)
        }
        
//        do{
//
//            recArray = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray)
//
//        }catch{
//            print("data not fetched")
//        }
        
        
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //autoVC?.prev = self
//    if nameOutlet.text?.isEmpty == false && lastnameOutlet.text?.isEmpty == false{
//    if contactOutlet.text?.isEmpty == false {
//    if contactOutlet.text?.count == 10{
//    userarr.append(nameOutlet.text!)
//    userarr.append(contactOutlet.text!)
//    var storyboard=UIStoryboard(name: "Main", bundle: nil)
//    var autoVC = storyboard.instantiateViewController(withIdentifier: "autoVC") as? autogenerateViewController
//    self.show(autoVC!, sender: nil)
//    autoVC?.welcomeOutlet.text=nameOutlet.text
//    autoVC?.name2Outlet.text=lastnameOutlet.text
//    autoVC?.welcomeOutlet.sizeToFit()
//    autoVC?.name2Outlet.sizeToFit()
//    //                autoVC?.name2Outlet.sizeToFit()
//    //autoVC?.prev = self
//    autoVC?.emailidOutelt.text = nameOutlet.text! + lastnameOutlet.text! + "@infosys.com"
//    autoVC?.emailidOutelt.sizeToFit()
//    }
//    else{
//    alert(msg: "Alert!!", info: "Invalid contact number", vc: self)
//    }
//    }
//    else{
//    alert(msg: "Alert!!", info: "Contact field cannot be empty", vc: self)
//    }
//    }
//    else{
//    alert(msg: "Alert!!!", info: "Name fields cannot be empty", vc: self)
//    }
//}

