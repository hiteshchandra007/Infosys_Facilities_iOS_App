//
//  ReallocateViewController.swift
//  Group2_Manager
//
//  Created by gec on 29/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class ReallocateViewController: UIViewController,NSURLConnectionDataDelegate {

    @IBOutlet weak var reallocateButton: UIButton!
    @IBOutlet weak var empId: UIButton!
    @IBOutlet weak var complaintDescr: UITextView!
    static var getUserCompData : NSMutableArray?
    var allocateddata : NSMutableArray?
    var serverData:Data?
    var index = AddressTableViewController.compTableIndex
    var flag = 0
    var flag1 = 0
    var staffid = ""
    var complaintid = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        empId.layer.cornerRadius = 8
        reallocateButton.layer.cornerRadius = 8
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.bordered, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        var d = AddressTableViewController.getComData![index] as! NSMutableDictionary
        complaintDescr.text = d.value(forKey: "complaintdescr") as! String
        complaintDescr.isEditable = false
        var dict = NSMutableDictionary()
        dict.setValue(d.value(forKey: "reqid"), forKey: "reqid")
        CustomConnection.toServer(dict, "getEmpCompDetails", self)
    }
    
    @IBAction func empCompDetailsAction(_ sender: UIButton) {
        let s = UIStoryboard(name: "Manager", bundle: nil)
        let empCompVC = s.instantiateViewController(withIdentifier: "empCompVC")
        self.navigationController?.pushViewController(empCompVC, animated: true)
    }
    
    @IBAction func reallocateAction(_ sender: UIButton) {
        flag1 = 1
            var d = AddressTableViewController.getComData![index] as! NSMutableDictionary
            CustomConnection.toServer(d, "reallocateStaff", self)
        
        
    }
    
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
  
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
        print("entered Connection")
        if (flag1 == 0){
        do{
            ReallocateViewController.getUserCompData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray
            var p = ReallocateViewController.getUserCompData![0] as! NSMutableDictionary
            print(ReallocateViewController.getUserCompData)
            empId.setTitle(p.value(forKey: "userid") as? String, for: .normal)
            flag = 1
            
        }catch{
            print("Sorry")
        }
        }else{
            flag1 = 0
            var qwe = String.init(data: data, encoding : .ascii)
            
            print("In RE Allocated data")
            if qwe == "No Staff Available"{
                let a = UIAlertController(title: "Not Available", message: "Currently Staff is not available", preferredStyle: .alert)
                let b1 = UIAlertAction(title: "OK", style: .default) { (_) in
                    self.navigationController?.popViewController(animated: true)
                }
                a.addAction(b1)
                self.present(a, animated: true, completion: nil)
            }else{
                do{
                    allocateddata = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray
                    
                    
                }catch{
                    print("Sorry")
                }
                let s = UIStoryboard(name: "Manager", bundle: nil)
                let radVC = s.instantiateViewController(withIdentifier: "radVC") as! ReallocateDetailsViewController
                self.navigationController?.pushViewController(radVC, animated: true)
                var d = allocateddata![0] as! NSMutableDictionary
                ReallocateDetailsViewController.reqid = d.value(forKey: "reqid") as! String
                ReallocateDetailsViewController.empid = d.value(forKey: "userid") as! String
                ReallocateDetailsViewController.descr = d.value(forKey: "descr") as! String
                ReallocateDetailsViewController.staffid = d.value(forKey: "staffid") as! String
//                var c = ""
//                if (d.value(forKey: "category") as! String == "E"){
//                    c = "Electrical"
//                }else if (d.value(forKey: "category") as! String == "H"){
//                    c = "HouseKeeping"
//                }else {
//                    c = "Stationary"
//                }
                ReallocateDetailsViewController.category = d.value(forKey: "category") as! String
            }
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
