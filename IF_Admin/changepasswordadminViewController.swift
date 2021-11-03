//
//  changepasswordadminViewController.swift
//  IF_Employee
//
//  Created by gec on 04/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class changepasswordadminViewController: UIViewController , NSURLConnectionDataDelegate{
    var flag = 0
    var serverData:Data?
    var serverData1:Data?
    var recArray:NSMutableArray?
    var recMutArray = NSMutableArray()
    
    @IBOutlet weak var lastNameOutlet: UILabel!
    
    
    @IBOutlet weak var shoeUserIdOutlet: UILabel!
    
    
    @IBOutlet weak var showusernameOutlet: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    
    @IBOutlet weak var showemailidOutlet: UILabel!
    
    @IBOutlet weak var showContactNoOutlet: UILabel!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var oldPasswordOutlet: UITextField!
    
    @IBOutlet weak var newPasswordOutlet: UITextField!
    
    @IBOutlet weak var captchaEnteredOutlet: UITextField!
    
    @IBOutlet weak var showCaptchaOutlet: UILabel!
    
    @IBOutlet weak var refreshOutlet: UIButton!
    
    
    @IBOutlet weak var saveOutlet: UIButton!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var newpasslabel: UILabel!
    
    @IBOutlet weak var captchaLabel: UILabel!
    
    @IBOutlet weak var viewoutlet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshFuction()
        // Do any additional setup after loading the view.
        let dict = NSMutableDictionary()
        //        dict.setValue(AdminViewController.usercredential, forKey: "userid")
        CustomConnection.toServer(dict, "userdetailsData", self)
//        usernameOutlet.isHidden = true
//        oldPasswordOutlet.isHidden = true
//        newPasswordOutlet.isHidden = true
//        captchaEnteredOutlet.isHidden = true
//        showCaptchaOutlet.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        contactLabel.isHidden = true
        showContactNoOutlet.isHidden = true
        
        viewoutlet.isHidden = false
        if flag == 1{
            for i in recArray!{
                print("enter2")
                print(AdminViewController.usercredential)
                var gd = i as! NSMutableDictionary
                if gd.value(forKey: "userid") as! String == AdminViewController.usercredential{
                    print("enter3")
                    //                    showusernameOutlet.text = gd.value(forKey: "firstname") as? String
                    shoeUserIdOutlet.text = gd.value(forKey: "userid") as? String
                    lastNameOutlet.text = gd.value(forKey: "lastname") as? String
                    showusernameOutlet.text = gd.value(forKey: "firstname") as? String
                    showemailidOutlet.text = gd.value(forKey: "email") as? String
                    showContactNoOutlet.text = gd.value(forKey: "contact") as? String
                }
            }
        }
        usernameOutlet.sizeToFit()
        shoeUserIdOutlet.sizeToFit()
        lastNameOutlet.sizeToFit()
        showusernameOutlet.sizeToFit()
        showemailidOutlet.sizeToFit()
        showContactNoOutlet.sizeToFit()
    }
    func refreshFuction() {
        let randomstring2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomstring1 = ""
        for _ in (0...5){
            let randomindex = Int(arc4random_uniform(62))
            randomstring1+=String(randomstring2[randomstring2.index(randomstring2.startIndex,offsetBy: randomindex)])
        }
        showCaptchaOutlet.text = randomstring1
        showCaptchaOutlet.sizeToFit()
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        alert100(vc: self)
    }
    
    func validatepassword(password:String) -> Bool{
        guard password != nil else {return false}
        let passwordTest = NSPredicate(format:"SELF MATCHES %@","(?=.*[A-Z])(?=.*[0-9])(?=.*[@!_])(?=.*[a-z]).{8,}")
        print("password")
        return passwordTest.evaluate(with:password)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePasswordAction(_ sender: UIButton) {
        viewoutlet.isHidden=true
    }
    
    
    
    @IBAction func refreshAction(_ sender: UIButton) {
        refreshFuction()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        var gd = NSMutableArray(array: recArray!)
        for i in gd {
            var p = i as! NSMutableDictionary
            //            print(p.value(forKey: "userid"))
            print("entering")
            if usernameOutlet.text == AdminViewController.usercredential && oldPasswordOutlet.text == p.value(forKey: "password") as! String && usernameOutlet.text == p.value(forKey: "userid") as! String {
                print("entered")
                if (newPasswordOutlet != oldPasswordOutlet && validatepassword(password: newPasswordOutlet.text!)) && captchaEnteredOutlet.text == showCaptchaOutlet.text{
                    print("password changed")
                    let dict = NSMutableDictionary()
                    dict.setValue(usernameOutlet.text, forKey: "userid")
                    dict.setValue(newPasswordOutlet.text, forKey: "password")
                    CustomConnection.toServer(dict, "updateuserDetails", self)
                    alert(msg: "Done!", info: "Password Changed Successfully", vc: self)
                }
                else{
                    print("passwordcouldnotbechanged")
                    alert(msg: "Invalid Credntials", info: "Password has not changed ", vc: self)
                }
            }
        }
        
        
    }
    
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        recArray = []
        print("enter4")
        do{
            print("Data: \(String.init(data: data, encoding: .ascii))")
            
            recArray = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray)
            
            
            flag = 1
            self.viewWillAppear(true)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
