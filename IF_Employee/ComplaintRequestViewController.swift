//
//  ComplaintRequestViewController.swift
//  IF_Employee
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ComplaintRequestViewController: UIViewController,NSURLConnectionDataDelegate {
    var row3:Int?
    var requestData:NSMutableArray?
    var serverData:Data?
    var f = 0
    var count = 0
    @IBOutlet var complaintDescrOutlet: UITextView!
    @IBOutlet var progressOutlet: UILabel!
    @IBOutlet var staffidOutlet: UILabel!
    @IBOutlet var requestidOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let dict = NSMutableDictionary()
        dict.setValue("all data", forKey: "staff")
        CustomConnection.toServer(dict, "fetchAllocatedData", self)
        
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
        print("did recieve data")
        print("Data: \(String.init(data: data, encoding: .ascii))")
        do{
            f = 1
            requestData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray
            print("data fetched")
            print(requestData)
            let p = (getOpenData1[row3!] as! NSMutableDictionary).value(forKey: "requestid") as! String
            print(p)
            for i in requestData!{
                
                let q = (i as! NSMutableDictionary).value(forKey: "reqid") as! String
                print(q)
                if p == q{
                    requestidOutlet.text = (requestData![count] as! NSMutableDictionary).value(forKey: "reqid") as! String
                    staffidOutlet.text = (requestData![count] as! NSMutableDictionary).value(forKey: "staffid") as! String
                    progressOutlet.text = (requestData![count] as! NSMutableDictionary).value(forKey: "progress") as! String
                    requestidOutlet.sizeToFit()
                    progressOutlet.sizeToFit()
                    progressOutlet.numberOfLines = 0
                }
                else{
                    count = count + 1
                }
            }
            
            
        }catch{
            print("Not fetched")
        }
        
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }

 
    @IBAction func RaiseComplaintAction(_ sender: UIButton) {
       
            let dict = NSMutableDictionary()
            dict.setValue(complaintDescrOutlet.text, forKey: "complaintdescr")
            dict.setValue(requestidOutlet.text, forKey: "requestid")
        if complaintDescrOutlet.text.isEmpty{
           var alert = UIAlertController(title: "Please provide the description", message: "", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if complaintDescrOutlet.text.count > 200{
            alert(msg: "Length of Complaint description cannot exceed 200 characters ", info: "", vc: self)
        }
        else{
            
           CustomConnection.toServer(dict, "updateComplaintRequest", self)
            complaintTable()
        var alert = UIAlertController(title: "Complaint Raised ", message: "Success", preferredStyle: .alert)
        var button = UIAlertAction(title: "Okay", style: .default){
            obj in self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
        
        }
            
        
        
    }
    func complaintTable(){
        let dict = NSMutableDictionary()
        let p = (getOpenData1[row3!] as! NSMutableDictionary).value(forKey: "userid") as! String
        dict.setValue(requestidOutlet.text, forKey: "reqid")
        dict.setValue(staffidOutlet.text, forKey: "staffid")
        dict.setValue(complaintDescrOutlet.text, forKey: "complaintdescr")
        dict.setValue(p, forKey: "employeeid")
        
        
        CustomConnection.toServer(dict, "addComplaint", self)
    }

}
