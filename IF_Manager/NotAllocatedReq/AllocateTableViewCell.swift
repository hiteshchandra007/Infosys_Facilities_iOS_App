//
//  AllocateTableViewCell.swift
//  Group2_Manager
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AllocateTableViewCell: UITableViewCell, NSURLConnectionDataDelegate {
    var serverData:Data?
    
    var p : AllocateRequestTableViewController?
    @IBOutlet weak var allocate: UIButton!
    @IBOutlet weak var requestName: UILabel!
    @IBOutlet weak var descOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        allocate.isHidden = true
//        self.layer.borderColor = UIColor.purple.cgColor
//        self.layer.cornerRadius = 10
        //insideView.layer.cornerRadius = 10
        //let dict = NSMutableDictionary()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    @IBAction func allocateAction(_ sender: UIButton) {
        var tempSel = AllocateRequestTableViewController.tempIndex
        var tempDict = AllocateRequestTableViewController.getData![tempSel] as! NSMutableDictionary
        tempDict["managerid"] = AdminViewController.usercredential
        print("EnteredAllocation")
        
        do {
            serverData = try JSONSerialization.data(withJSONObject: tempDict, options: .init(rawValue: 0))
            let dataString = String.init(data: serverData!, encoding: String.Encoding.ascii)
            print("Data as String: ",dataString)
        }
        catch {
            print("Failed to convert the object to raw data format")
        }
        let url = URL.init(string: "http://localhost:8080/WebApplication2/Controller/allocateStaff")
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serverData
        print(request.allHTTPHeaderFields)
        let connection = NSURLConnection(request: request, delegate: self)
        connection?.start()
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
        let qqq = String.init(data: data, encoding: .ascii)
        print(qqq)
        
        if qqq == "Sorry"{
            var alert = UIAlertController(title: "Staff Are not available", message: "No Staff ", preferredStyle: .alert)
            var b1 = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(b1)
            p?.present(alert, animated: true, completion: nil)
            
        }
        else{
            
            let alert = UIAlertController(title: "Success", message: "Request has been allocated Succesfully", preferredStyle: .alert)
            let b1 = UIAlertAction(title: "OK", style: .default) { (_) in
                let s = UIStoryboard(name: "Manager", bundle: nil)
                let adVC = s.instantiateViewController(withIdentifier: "adVC") as! AllocatedDetailsViewController
                self.p?.show(adVC, sender: nil)
                adVC.selectedItem = AllocateRequestTableViewController.tempIndex
                adVC.generalAllocationStaffId = qqq!
                //AllocateRequestTableViewController.arr.remove(at: self.selectedItem)
            }
            alert.addAction(b1)
            p?.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
}
