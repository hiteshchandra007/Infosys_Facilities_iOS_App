//
//  AllocatedRequestsUpdatedTableViewController.swift
//  Group2_Manager
//
//  Created by gec on 27/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AllocatedRequestsUpdatedTableViewController: UITableViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var c = 0
    var serverData:Data?
    var getData:NSMutableArray?
    var manArr = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        c = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let dict = NSMutableDictionary()
        CustomConnection.toServer(dict, "getAllocatedData", self)
        manArr = []
        if flag == 1{
            if (getData?.count)! > 0{
                for i in getData!{
                    var bb = i as! NSMutableDictionary
                    if bb.value(forKey: "managerid") as! String == AdminViewController.usercredential{
                        manArr.add(bb)
                    }
                }
            }
            
        }
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if flag == 0{
            return 0
        }else{
            return manArr.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! AllocatedTableViewCell
        if flag == 0{
            return cell
        }else{
            var q = manArr[indexPath.row] as! NSMutableDictionary
            cell.reqidOutlet.text = q.value(forKey: "reqid") as! String
            cell.staffIdOutlet.text = q.value(forKey: "staffid") as! String
            cell.reqidOutlet.sizeToFit()
            cell.staffIdOutlet.sizeToFit()
            return cell
        }
        // Configure the cell...

        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        flag = 1
        c += 1
        print("Data: \(String.init(data: data, encoding: .ascii))")
        print("I AM HERE")
        do{
            getData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray
            print(getData)
        }catch{
            print("Sorry")
        }
        if c == 1{
            self.viewWillAppear(true)
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
