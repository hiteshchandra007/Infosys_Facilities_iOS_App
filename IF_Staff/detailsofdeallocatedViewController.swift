//
//  detailsofdeallocatedViewController.swift
//  JDBCiOS
//
//  Created by gec on 01/03/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class detailsofdeallocatedViewController: UIViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    var recArray:NSMutableArray?
    var requiredreqid = ""
    static var updateforreqid = ""
    var recMutArray = NSMutableArray()



    @IBOutlet var userIdOutlet: UIButton!
    
    @IBOutlet var categoryOutlet: UILabel!
    
    @IBOutlet var buildingNameOutlet: UILabel!
    
    @IBOutlet var eccNumberOutlet: UILabel!
    
    @IBOutlet var cabinNumberOutlet: UILabel!
    
    
    @IBOutlet var roomNumberOutlet: UILabel!
    
    @IBOutlet var floorOutlet: UILabel!
    
    @IBOutlet var descriptionOutlet: UILabel!
    @IBOutlet var statusOutlet: UILabel!
     static var selectedUserid = ""

    
    @IBOutlet var complaintOutlet: UILabel!
    

    override func viewDidLoad() {
        
        print(requiredreqid)
        allocaterequestdetailasViewController.updateforreqid = requiredreqid
        print("see thissssss")
        super.viewDidLoad()
        let dict = NSMutableDictionary()
        //        dict.setValue(usercredential, forKey: "staffid")
        CustomConnection.toServer(dict, "allocatedrequestData", self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        if flag == 1 {
            
            for i in recArray!{
                
                var gd = i as! NSMutableDictionary
                
                if requiredreqid == gd.value(forKey: "reqid") as! String{
                    print("WOW")
                    detailsofdeallocatedViewController.selectedUserid = gd.value(forKey: "userid") as! String

                    print(gd.value(forKey: "category"))
                    var title = gd.value(forKey: "userid") as! String
                    userIdOutlet.setTitle(title, for: .normal)
                    categoryOutlet.text = gd.value(forKey: "category") as! String
                    buildingNameOutlet.text = gd.value(forKey: "buildingnumber") as! String
                    eccNumberOutlet.text = gd.value(forKey: "eccnumber") as! String
                    cabinNumberOutlet.text = gd.value(forKey: "cabinnumber") as! String
                    roomNumberOutlet.text = gd.value(forKey: "roomnumber") as! String
                    floorOutlet.text = gd.value(forKey: "floor") as! String
                    descriptionOutlet.text = gd.value(forKey: "description") as! String
                    statusOutlet.text = gd.value(forKey: "status") as! String
                   
                    complaintOutlet.text = gd.value(forKey: "complaintdescr") as! String
                    
                }
                categoryOutlet.sizeToFit()
                buildingNameOutlet.sizeToFit()
                eccNumberOutlet.sizeToFit()
                cabinNumberOutlet.sizeToFit()
                roomNumberOutlet.sizeToFit()
                floorOutlet.sizeToFit()
                descriptionOutlet.sizeToFit()
                statusOutlet.sizeToFit()
                
                complaintOutlet.sizeToFit()
               
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
                //                print(p.value(forKey: "reqid"))
            }
            flag = 1
            
        }catch{
            print("data not fetched")
        }
        viewWillAppear(true)
        
        
        
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
