//
//  AdminSignUpViewController.swift
//  IF_Employee
//
//  Created by gec on 05/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AdminSignUpViewController: UIViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    var serverData1:Data?
    var recArray:NSMutableArray?
    var recMutArray = NSMutableArray()
    
    
    @IBOutlet weak var reenterOutlet: UITextField!
    @IBOutlet weak var firstnameOutlet: UITextField!
    
    @IBOutlet weak var lastnameOutlet: UITextField!
    
    
    @IBOutlet weak var passwordOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    func validatepassword(_ password:String) -> Bool{
        guard password != nil else {return false}
        let passwordTest = NSPredicate(format:"SELF MATCHES %@","(?=.*[A-Z])(?=.*[0-9])(?=.*[@!_])(?=.*[a-z]).{8,}")
        print("password")
        return passwordTest.evaluate(with:password)
    }
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        var array = [String]()
        var message = ""
        if !validatename(firstnameOutlet.text!){
            array.append("name")
        }
        if !validateLastName(lastnameOutlet.text!){
            array.append("lastname")
        }
        if !validatepassword(passwordOutlet.text!){
            array.append("password")
        }
        for i in array{
            message+=" "+i
        }
        if array.count>0{
            alert(msg: "Please,enter valid credentials for following details", info: message, vc: self)
        }else if passwordOutlet.text != reenterOutlet.text{
            passwordOutlet.text = ""
            reenterOutlet.text = ""
            alert(msg: "Mis-Match!", info: "Password and reenter password are not matching, please reenter them", vc: self)
        }
        else{
        let dict = NSMutableDictionary()
        dict.setValue(firstnameOutlet.text, forKey: "firstname")
        dict.setValue(lastnameOutlet.text, forKey: "lastname")
        dict.setValue(passwordOutlet.text, forKey: "password")
        CustomConnection.toServer(dict, "updatesignUpDetails", self)
            
        }
        
    }
    
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        var check = String.init(data: data, encoding: .ascii)!
        if check == "Done"{
            let alert2 = UIAlertController(title: "Hey!! Admin", message: "Please login as id:A1001, password:\(passwordOutlet.text!)", preferredStyle: .alert)
            let b1 = UIAlertAction(title: "OK", style: .default) { (_) in
                
                self.dismiss(animated: true, completion: nil)
            }
            alert2.addAction(b1)
            self.show(alert2, sender: nil)
            firstnameOutlet.text = ""
            lastnameOutlet.text = ""
            passwordOutlet.text = ""
            reenterOutlet.text = ""
        }
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    


}
