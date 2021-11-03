//
//  CloseRequestViewController.swift
//  IF_Employee
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class CloseRequestViewController: UIViewController,NSURLConnectionDataDelegate {
    var row1:Int?
    var serverData:Data?

    @IBOutlet var closingDescrOutlet: UITextView!
    @IBOutlet var requestOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        requestOutlet.text = (getData1[row1!] as! NSMutableDictionary).value(forKey: "requestid") as! String
        requestOutlet.sizeToFit()
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        let dict = NSMutableDictionary()
        dict.setValue(closingDescrOutlet.text, forKey: "closeddescr")
        dict.setValue("Closed", forKey: "status")
        dict.setValue((getData1[row1!] as! NSMutableDictionary).value(forKey: "userid") as! String, forKey: "closedby")
        dict.setValue(requestOutlet.text, forKey: "requestid")
        
        if closingDescrOutlet.text.isEmpty{
            var alert = UIAlertController(title: "Please provide the description", message: "", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if closingDescrOutlet.text.count > 200{
            alert(msg: "Length of Closing description cannot exceed 200 characters ", info: "", vc: self)
        }
        else{
        
        CustomConnection.toServer(dict, "updateClosedRequest", self)
        var alert = UIAlertController(title: "Request closed ", message: "Success", preferredStyle: .alert)
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
