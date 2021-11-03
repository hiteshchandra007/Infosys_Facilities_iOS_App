//
//  OpenRequestTableViewController.swift
//  JDBCiOS
//
//  Created by gec on 28/02/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class OpenRequestTableViewController_Staff: UITableViewController, NSURLConnectionDataDelegate {
    var flag = 0
    var serverData:Data?
    var recArray:NSMutableArray?
    var selectedRow = ""
    static var c = 0
    
    @IBOutlet var tableViewOutlet: UITableView!
    
    
    var recMutArray = NSMutableArray()
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
       CustomConnection.toServer(dict, "allocateddata", self)
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
        return 80
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCellallocate
        if flag == 0 {
            return cell
        }else{
            let p = recArray![indexPath.row] as! NSMutableDictionary
        cell.assignedToOutlet?.text = p.value(forKey: "reqid") as! String
            cell.assignedByOutlet?.text = p.value(forKey: "managerid") as! String
//            cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
    
//            cell.textLabel?.text = p.value(forKey: "reqid") as! String
            cell.assignedByOutlet.sizeToFit()
            cell.assignedToOutlet.sizeToFit()
            
        }

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let val = recArray![indexPath.row] as! NSMutableDictionary
        
        var storyboard = UIStoryboard(name: "Staff", bundle: nil)
        var nextVC = storyboard.instantiateViewController(withIdentifier: "allocaterequestdetailsVC") as! allocaterequestdetailasViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.requiredreqid = val.value(forKey: "reqid") as! String
    }
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        recArray = []
        do{
            print("Data: \(String.init(data: data, encoding: .ascii))")
            
            recArray = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray)
            
            var gd = NSMutableArray(array: recArray!)
            for i in gd {
                var p = i as! NSMutableDictionary
                print(p.value(forKey: "reqid"))
            }
            flag = 1
            if (recArray?.count)!>OpenRequestTableViewController_Staff.c{
                notification("New Request and Complaints are present", "Please check them")
            }
            OpenRequestTableViewController_Staff.c = (recArray?.count)!
            
            tableViewOutlet.reloadData()
            
            
            
        }catch{
            print("data not fetched")
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
