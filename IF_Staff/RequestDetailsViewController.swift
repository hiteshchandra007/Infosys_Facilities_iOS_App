//
//  RequestDetailsViewController.swift
//  JDBCiOS
//
//  Created by gec on 28/02/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class RequestDetailsViewController: UIViewController {
    
    @IBOutlet var userIdOutlet: UIButton!
    
    @IBOutlet var categoryOutlet: UILabel!
    
    @IBOutlet var buildingNameOutlet: UILabel!
    
    @IBOutlet var eccNumberOutlet: UILabel!
    
    @IBOutlet var cabinNumberOutlet: UILabel!
    
    @IBOutlet var roomNumberOutlet: UILabel!
    
    @IBOutlet var floorOutlet: UILabel!
    
    @IBOutlet var descriptionOutlet: UILabel!
    
    @IBOutlet var statusOutlet: UILabel!
    
    @IBOutlet var closedDescrOutlet: UILabel!
    
    @IBOutlet var reopenedDescrOutlet: UILabel!
    

    
    
    @IBOutlet var closedByOutlet: UILabel!
    
    
    
    
    
    static var selectedUserid = ""
    var row1 = 0
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requiredArray = ClosedRequestTableViewController.recArray
        for i in requiredArray!{
            if count == row1{
                var gd = i as! NSMutableDictionary
                print("WOW")
                print(gd.value(forKey: "category"))
                RequestDetailsViewController.selectedUserid = gd.value(forKey: "userid") as! String
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
                closedDescrOutlet.text = gd.value(forKey: "closeddescr") as! String
                reopenedDescrOutlet.text = gd.value(forKey: "reopeneddescr") as! String
                
                closedByOutlet.text = gd.value(forKey: "closedby") as! String
                
            }
            
            count+=1
            categoryOutlet.sizeToFit()
            buildingNameOutlet.sizeToFit()
            eccNumberOutlet.sizeToFit()
            cabinNumberOutlet.sizeToFit()
            roomNumberOutlet.sizeToFit()
            floorOutlet.sizeToFit()
            descriptionOutlet.sizeToFit()
            statusOutlet.sizeToFit()
            closedDescrOutlet.sizeToFit()
            reopenedDescrOutlet.sizeToFit()
            
            closedByOutlet.sizeToFit()
            
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    
    

//    @IBAction func userIdAction(_ sender: UIButton) {
//        var storyboard = UIStoryboard(name: "Staff", bundle: nil)
//        var nextVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailsVC") as! EmployeeDetailsViewController
//        self.navigationController?.pushViewController(nextVC, animated: true)
    
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
