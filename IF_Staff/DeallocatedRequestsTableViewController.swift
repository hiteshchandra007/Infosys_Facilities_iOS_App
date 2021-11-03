//
//  DeallocatedRequestsTableViewController.swift
//  JDBCiOS
//
//  Created by gec on 28/02/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class DeallocatedRequestsTableViewController: UITableViewController,NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    var recArray:NSMutableArray?
    var selectedRow = ""
    @IBOutlet var tableViewControllerOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.black
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
        let dict = NSMutableDictionary()
        dict.setValue(AdminViewController.usercredential, forKey: "staffid")
        CustomConnection.toServer(dict, "deallocateddata", self)
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        alert100(vc: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            return (recArray?.count)!
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCelldeallocate
        if flag == 0 {
            return cell
        }else{
            let p = recArray![indexPath.row] as! NSMutableDictionary
//            cell.textLabel?.text = p.value(forKey: "reqid") as! String
//                cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
            cell.assignedtoOutlet?.text = p.value(forKey: "reqid") as! String
          cell.assignedtoOutlet.sizeToFit()
            cell.textLabel?.sizeToFit()
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let val = recArray![indexPath.row] as! NSMutableDictionary
        
        var storyboard = UIStoryboard(name: "Staff", bundle: nil)
        var nextVC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! detailsofdeallocatedViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.requiredreqid = val.value(forKey: "reqid") as! String
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var storyboard = UIStoryboard(name: "Main", bundle: nil)
//        var nextVC = storyboard.instantiateViewController(withIdentifier: "UpdateStatusVC") as! UpdateStatusViewController
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
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
            tableViewControllerOutlet.reloadData()
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
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
