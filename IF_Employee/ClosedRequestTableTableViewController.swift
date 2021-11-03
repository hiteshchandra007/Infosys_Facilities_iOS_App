//
//  ClosedRequestTableTableViewController.swift
//  IF_Employee
//
//  Created by gec on 23/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit
var getClosedData:NSMutableArray?
var getClosedData1 = NSMutableArray()
class ClosedRequestTableTableViewController: UITableViewController,NSURLConnectionDataDelegate {
    var f = 0
    var c = 0
    
    
    var serverData:Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        c = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.isEditing = false
        let dict = NSMutableDictionary()
        dict.setValue("all data", forKey: "staff")
        CustomConnection.toServer(dict, "fetchClosedRequest", self)
        getClosedData1 = []
        if f == 1{
            if (getClosedData?.count)! > 0{
                for i in getClosedData!{
                    var bb = i as! NSMutableDictionary
                    if bb.value(forKey: "userid") as! String == AdminViewController.EmployeeId{
                        getClosedData1.add(bb)
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reopenAction(_ sender: UIBarButtonItem) {
        if self.isEditing == true{
            self.isEditing = false
        }else{
            self.isEditing = true
        }
        
    }
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        alert100(vc: self)
        
    }
    

    // MARK: - Table view data source
  

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if f == 0{
            return 0
        }else{
            return (getClosedData1.count)
        }
    }
 
  

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "closedRequestCell", for: indexPath)
        if f == 0{
            return cell
        }else{
            let p = getClosedData1[indexPath.row] as! NSMutableDictionary
            cell.textLabel?.text = (p.value(forKey: "requestid") as! String)
            
            return cell
        }
        
       

        // Configure the cell...

       
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Request IDs"
    }
 
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .insert
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        c += 1
        print("did recieve data")
        print("Data: \(String.init(data: data, encoding: .ascii))")
        do{
            f = 1
            getClosedData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray
            var q = NSMutableArray(array: getClosedData!)
            print(q)
            
            for i in q{
                var p = i as! NSMutableDictionary
                print(p.value(forKey:"requestid"))
            }
            tableView.reloadData()
            if c == 1{
                self.viewWillAppear(true)
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

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            let storyBoard = UIStoryboard(name: "Employee", bundle: nil)
            let reopenVC = storyBoard.instantiateViewController(withIdentifier: "reopenVC") as! ReOpenRequestViewController
            reopenVC.row2 = indexPath.row
            
            self.show(reopenVC, sender: nil)
           
            
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
