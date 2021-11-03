//
//  AddressTableViewController.swift
//  Group2_Manager
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AddressTableViewController: UITableViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    static var getComData : NSMutableArray?
    static var compTableIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        let dict = NSMutableDictionary()
        CustomConnection.toServer(dict, "getComplaintsData", self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if flag == 0{
            return 0
        }else{
            return (AddressTableViewController.getComData?.count)!
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "complaintsCell", for: indexPath) as! ComplaintsTableViewCell
        if flag == 0{
            return cell
        }else{
            var q = AddressTableViewController.getComData![indexPath.row] as! NSMutableDictionary
//            cell.empIdAction.setTitle(q.value(forKey: "employeeid") as! String, for: .normal)
            cell.complaintId.text = q.value(forKey: "complaintid") as! String
            cell.compDescr.text = q.value(forKey: "complaintdescr") as! String
            cell.as1 = self
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AddressTableViewController.compTableIndex = indexPath.row
        let cell = tableView.cellForRow(at: indexPath) as! ComplaintsTableViewCell
        let s = UIStoryboard(name: "Manager", bundle: nil)
        let  reVC = s.instantiateViewController(withIdentifier: "reVC") as! ReallocateViewController
        self.navigationController?.pushViewController(reVC, animated: true)
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        flag = 1
        
        print("Data: \(String.init(data: data, encoding: .ascii))")
        print("I AM HERE")
        do{
            AddressTableViewController.getComData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray
            print(AddressTableViewController.getComData)
            if let tabItems = tabBarController?.tabBar.items{
                let tabItem = tabItems[1]
                tabItem.badgeValue = String(AddressTableViewController.getComData!.count)
            }
            
        }catch{
            print("Sorry")
        }
        tableView.reloadData()
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        alert100(vc: self)
    }
    
   
}
