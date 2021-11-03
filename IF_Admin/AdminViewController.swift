//
//  ViewController.swift
//  project
//
//  Created by gec on 24/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController,NSURLConnectionDataDelegate {
    static var usercredential = ""
    static var EmployeeId = ""
     var serverData:Data?
    var flag = 0
    var flag1 = 0
    var allDataArr : NSMutableArray?
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var PasswordOutlet: UITextField!
    
    
    @IBOutlet weak var imageoutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        imageoutlet.image = UIImage.init(named: "1")
      
    }
    override func viewWillAppear(_ animated: Bool) {
        let dict = NSMutableDictionary()
        CustomConnection.toServer(dict, "getAllData", self)
        usernameOutlet.text = ""
        PasswordOutlet.text = ""
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func passwordAction(_ sender: UIButton) {
        PasswordOutlet.isSecureTextEntry = !(PasswordOutlet.isSecureTextEntry)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if flag == 1{
            if allDataArr?.count == 0{
                let alert2 = UIAlertController(title: "Admin Needed", message: "Please signup as admin", preferredStyle: .alert)
                let b1 = UIAlertAction(title: "OK", style: .default) { (_) in
                    let s = UIStoryboard(name: "Main", bundle: nil)
                    let adminSignUpVC = s.instantiateViewController(withIdentifier: "adminSignUpVC") as! AdminSignUpViewController
                    self.show(adminSignUpVC, sender: nil)
                }
                alert2.addAction(b1)
                self.show(alert2, sender: nil)
            }
            else if usernameOutlet.text?.count == 0{
                alert(msg: "Invalid", info: "Name cannot be empty", vc: self)
            }else if PasswordOutlet.text?.count == 0{
                alert(msg: "Invalid", info: "Password cannot be empty", vc: self)
            }else if (usernameOutlet.text?.count == 0 && PasswordOutlet.text?.count == 0){
                alert(msg: "Invalid", info: "Name and Password cannot be empty", vc: self)
            }
            else{
                
                for i in 0..<allDataArr!.count{
                    let d = allDataArr![i] as! NSMutableDictionary
                    if usernameOutlet.text == d["email"] as! String && PasswordOutlet.text == d["password"] as! String {
                        flag1=1
                        print("email is working")
                        let requireduserid = d["userid"] as! String
                        if requireduserid.hasPrefix("S"){
                            print("Staff login executed")
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Staff", bundle: nil)
                            let adminVC = storyboard.instantiateViewController(withIdentifier: "staffVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }else if requireduserid.hasPrefix("E"){
                            AdminViewController.EmployeeId = d["userid"] as! String
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Employee", bundle: nil)
                            let adminVC = storyboard.instantiateViewController(withIdentifier: "employeeVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }else if requireduserid.hasPrefix("M"){
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Manager", bundle: nil)
                            let adminVC = storyboard.instantiateViewController(withIdentifier: "ManagerVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }else if requireduserid.hasPrefix("A"){
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Main", bundle: nil)
                            let adminVC = storyboard.instantiateViewController(withIdentifier: "adminVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }
                    }else if usernameOutlet.text == d["userid"]  as! String && PasswordOutlet.text == d["password"] as! String{
                        flag1=1
                        var requireduserid = d["userid"] as! String
                        if requireduserid.hasPrefix("S"){
                            print("Staff login executed 2")
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Staff", bundle: nil)
                            var adminVC = storyboard.instantiateViewController(withIdentifier: "staffVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }else if requireduserid.hasPrefix("E"){
                            AdminViewController.usercredential = d["userid"] as! String
                            AdminViewController.EmployeeId = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Employee", bundle: nil)
                            var adminVC = storyboard.instantiateViewController(withIdentifier: "employeeVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }else if requireduserid.hasPrefix("M"){
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Manager", bundle: nil)
                            var adminVC = storyboard.instantiateViewController(withIdentifier: "ManagerVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }
                        else if requireduserid.hasPrefix("A"){
                            AdminViewController.usercredential = d["userid"] as! String
                            let storyboard=UIStoryboard(name: "Main", bundle: nil)
                            let adminVC = storyboard.instantiateViewController(withIdentifier: "adminVC")
                            self.present(adminVC, animated: true, completion: nil)
                        }
                    }
                }
                if flag1 != 1{
                    alert(msg: "Error", info: "Please enter correct credentials", vc: self)
                }
            }
            
            
        }
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
        do{
        
            allDataArr = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray)
            print(allDataArr)
            flag = 1
            
        }catch{
            print("data not fetched")
        }
        
        
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
        


}
