//
//  AllocateRequestTableViewController.swift
//  Group2_Manager
//
//  Created by gec on 26/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class AllocateRequestTableViewController: UITableViewController, NSURLConnectionDataDelegate {
    var flag = 0
    static var tempIndex = -1
    static var next1 = 0
    var serverData:Data?
    static var managerArr:NSMutableArray?
    static var getData:NSMutableArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let dict = NSMutableDictionary()
        CustomConnection.toServer(dict, "getRequestData", self)
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
            return (AllocateRequestTableViewController.getData?.count)!
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! AllocateTableViewCell
        if flag == 0{
            return cell
        }else{
            var q = AllocateRequestTableViewController.getData![indexPath.row] as! NSMutableDictionary
            cell.requestName.text = q.value(forKey: "reqid") as! String
            cell.p = self
            cell.requestName.sizeToFit()
            cell.descOutlet.text = q.value(forKey: "Description") as! String
            cell.descOutlet.sizeToFit()
            return cell
        }
        

        // Configure the cell...

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AllocateRequestTableViewController.tempIndex = indexPath.row
        var p = tableView.cellForRow(at: indexPath) as! AllocateTableViewCell
        if p.allocate.isHidden == true{
            p.allocate.isHidden = false
            //p.allocate.isEnabled = true
            for i in tableView.indexPathsForVisibleRows!{
                if i != indexPath{
                    var p1 = tableView.cellForRow(at: i) as! AllocateTableViewCell
                    p1.allocate.isHidden = true
                }
            }
        }
        
        
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        flag = 1
        
        print("Data: \(String.init(data: data, encoding: .ascii))")
        print("I AM HERE")
        do{
            print("***********************************************************")
            print(AdminViewController.usercredential)
            AllocateRequestTableViewController.getData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableArray
            if(AllocateRequestTableViewController.getData?.count == 1){
                var p = AllocateRequestTableViewController.getData![0] as! NSMutableDictionary
                if(p.value(forKey: "userid") as! String == "0"){
                    flag = 0
                    if(p.value(forKey: "badge") as! Int == 0){
                        print("no complaints")
                    }else if(p.value(forKey: "userid") as! String == "0" && p.value(forKey: "badge") as! Int > 0){
                        AllocateRequestTableViewController.next1 += 1
                        if(AllocateRequestTableViewController.next1 == 1){
                            if let tabItems = tabBarController?.tabBar.items{
                                let tabItem = tabItems[1]
                                tabItem.badgeValue = String(p.value(forKey: "badge") as! Int)
                                let al = UIAlertController(title: "You have recieved complaints", message: "Click view to see complaints", preferredStyle: .alert)
                                let b1 = UIAlertAction(title: "View", style: .default) { (_) in
                                    self.tabBarController?.selectedIndex = 1
                                }
                                al.addAction(b1)
                                let b2 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                                al.addAction(b2)
                                self.present(al, animated: true, completion: nil)
                            }
                        }
                        
                    }
                }
            }
                if((AllocateRequestTableViewController.getData?.count)! > 0){
                    var p = AllocateRequestTableViewController.getData![0] as! NSMutableDictionary
                    if(p.value(forKey: "userid") as! String != "0"){
                        flag = 1
                        tableView.reloadData()
                        if p.value(forKey: "badge") as! Int > 0{
                            AllocateRequestTableViewController.next1 += 1
                            if(AllocateRequestTableViewController.next1 == 1){
                                if let tabItems = tabBarController?.tabBar.items{
                                    let tabItem = tabItems[1]
                                    tabItem.badgeValue = String(p.value(forKey: "badge") as! Int)
                                    let al = UIAlertController(title: "You have recieved complaints", message: "Click view to see complaints", preferredStyle: .alert)
                                    let b1 = UIAlertAction(title: "View", style: .default) { (_) in
                                        self.tabBarController?.selectedIndex = 1
                                    }
                                    al.addAction(b1)
                                    let b2 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                                    al.addAction(b2)
                                    self.present(al, animated: true, completion: nil)
                                }
                            }
                        }
                        
                        
                }
                
                
            }
            tableView.reloadData()
            
           
        }catch{
            print("Sorry")
        }
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        alert100(vc: self)
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }


   
}
