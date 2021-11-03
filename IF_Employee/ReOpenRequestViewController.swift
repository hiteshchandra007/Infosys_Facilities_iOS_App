//
//  ReOpenRequestViewController.swift
//  IF_Employee
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ReOpenRequestViewController: UIViewController,NSURLConnectionDataDelegate {
    var row2:Int?
    var serverData:Data?
    
    @IBOutlet var requestIDOutlet: UILabel!
    
    @IBOutlet var reOpenDescrOutlet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        requestIDOutlet.text = (getClosedData1[row2!] as! NSMutableDictionary).value(forKey: "requestid") as! String
        requestIDOutlet.sizeToFit()
    }
    
    @IBAction func ReOpenAction(_ sender: UIButton) {
        let dict = NSMutableDictionary()
        dict.setValue(reOpenDescrOutlet.text, forKey: "reopendescr")
        dict.setValue("Pending", forKey: "status")
    
        dict.setValue(requestIDOutlet.text, forKey: "requestid")
        
        if reOpenDescrOutlet.text.isEmpty{
            var alert = UIAlertController(title: "Please provide the description", message: "", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if reOpenDescrOutlet.text.count > 200{
           alert(msg: "Length of reopened description cannot exceed 200 characters ", info: "", vc: self)
        }
        else{
        
        CustomConnection.toServer(dict, "updateReopenRequest", self)
        var alert = UIAlertController(title: "Request Re-Opened ", message: "Success", preferredStyle: .alert)
        var button = UIAlertAction(title: "Okay", style: .default){
            obj in self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
        }
        
    }
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        print("Data: \(String.init(data: data, encoding: .ascii))")
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    
   

}
