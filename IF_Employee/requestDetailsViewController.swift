//
//  requestDetailsViewController.swift
//  IF_Employee
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class requestDetailsViewController: UIViewController,NSURLConnectionDataDelegate {
    var requestData:NSMutableArray?
    var serverData:Data?
    var f = 0
    var row:Int?
    var count = 0
   
    @IBOutlet var progressOutlet: UILabel!
    @IBOutlet var staffidOutlet: UILabel!
    @IBOutlet var requestidLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
}

        // Do any additional setup after loading the view.
    

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
            let p = (getData1[row!] as! NSMutableDictionary).value(forKey: "requestid") as! String
            print(p)
            for i in requestData!{
                
                let q = (i as! NSMutableDictionary).value(forKey: "reqid") as! String
                print(q)
                if p == q{
                    requestidLabel.text = (requestData![count] as! NSMutableDictionary).value(forKey: "reqid") as! String
                    staffidOutlet.text = (requestData![count] as! NSMutableDictionary).value(forKey: "staffid") as! String
                    progressOutlet.text = (requestData![count] as! NSMutableDictionary).value(forKey: "progress") as! String
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

    

   

}
