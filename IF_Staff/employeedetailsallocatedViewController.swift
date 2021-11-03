//
//  employeedetailsallocatedViewController.swift
//  JDBCiOS
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class employeedetailsallocatedViewController: UIViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    var recArray:NSMutableArray?
    
    @IBOutlet var firstnameOutlet: UILabel!
    
    @IBOutlet var lastnameOutlet: UILabel!
    
    @IBOutlet var contactOutlet: UILabel!
    
    @IBOutlet var emailOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dict = NSMutableDictionary()
        
        CustomConnection.toServer(dict, "userdetailsData", self)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if flag == 1{
            for i in recArray!{
                
                var gd = i as! NSMutableDictionary
                print("WOW")
                if allocaterequestdetailasViewController.selectedUserid == gd.value(forKey: "userid") as! String{
                    print(gd.value(forKey: "category"))
                    firstnameOutlet.text = gd.value(forKey: "firstname") as! String
                    lastnameOutlet.text = gd.value(forKey: "lastname") as! String
                    
                    contactOutlet.text = gd.value(forKey: "contact") as! String
                    emailOutlet.text = gd.value(forKey: "email") as! String
                    firstnameOutlet.sizeToFit()
                    lastnameOutlet.sizeToFit()
                    contactOutlet.sizeToFit()
                    emailOutlet.sizeToFit()
                }
                
            }
        }
    }
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        do{
            print("Data: \(String.init(data: data, encoding: .ascii))")
            
            recArray = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray)
            
            var gd = NSMutableArray(array: recArray!)
            for i in gd {
                var p = i as! NSMutableDictionary
                print(p.value(forKey: "reqid"))
            }
            flag = 1
            viewWillAppear(true)
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
