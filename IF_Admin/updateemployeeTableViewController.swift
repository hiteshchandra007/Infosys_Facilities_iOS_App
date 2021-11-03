//
//  updateemployeeTableViewController.swift
//  project
//
//  Created by gec on 25/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit
var index1:Int?
var a1:String?
var serverData:Data?
var getData_Admin:NSMutableArray?
//var s:NSMutableDictionary?
var desigFlag = 0
var emparr = NSMutableArray()
var staffarr = NSMutableArray()
var mngarr = NSMutableArray()


class updateemployeeTableViewController: UITableViewController,NSURLConnectionDataDelegate {
    var ui = ""
    var fn = ""
    var ln = ""
    var cont1=""
    var de1=""
    var flag=0
    
    @IBOutlet weak var deleteOutlet: UIBarButtonItem!
    @IBOutlet weak var updateOutlet: UIBarButtonItem!
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    @IBAction func segment(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    var arr=[String]()
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let dict=NSMutableDictionary()
        updateOutlet.isEnabled = false
        deleteOutlet.isEnabled = false
        
        CustomConnection.toServer(dict, "fetchuserdetails", self)
        
     
    }
    
    func split() {
        
        emparr = []
        mngarr = []
        staffarr = []
        for i in getData_Admin!{
            var sa = i as! NSMutableDictionary
            print(sa.value(forKey: "role"))
            var star = sa.value(forKey: "role") as? String
            var n2 = sa.value(forKey: "status") as? String
            if star?.count != 0{
                if (star?.hasPrefix("E"))!{
                    if n2 != "N"{
                        
                        emparr.add(sa)
                        print("asdfghj")
                        print(emparr)
                        print("ffghjk")
                    }
                }
                else if (star?.hasPrefix("M"))!{
                    if n2 != "N"{
                        
                        mngarr.add(sa)
                        print(mngarr)
                    }
                }
                else if (star?.hasPrefix("S"))!{
                    if n2 != "N"{
                        
                        staffarr.add(sa)
                        print(staffarr)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
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
        
        if flag == 1{
            if segmentOutlet.selectedSegmentIndex == 0{
                desigFlag = 1
                return emparr.count
            }
            else if segmentOutlet.selectedSegmentIndex == 1{
                desigFlag = 0
                return staffarr.count
            }
            else if segmentOutlet.selectedSegmentIndex == 2{
                desigFlag = 0
                return mngarr.count
            }
            else{
                return 0
            }
        }
        else{
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! empupdateTableViewCell
        
        if flag == 0{
            return cell
        }
            
        else{
            //            var s = getData![indexPath.row] as? NSMutableDictionary
            //            var t:String = (s?.value(forKey: "firstname") as? String)!
            //            var x:String = (s?.value(forKey: "userid") as? String)!
            //            print(t)
            //cell.textLabel?.text = t
            
            //
            //          cell.emplnameOutlet.text = t
            //          cell.emplnameOutlet.sizeToFit()
            //            cell.useridoutlet.text = x
            //            cell.useridoutlet.sizeToFit()
            //            print("!@_#")
            
            
                
                if segmentOutlet.selectedSegmentIndex == 0{
                    cell.designationOutlet.isHidden = false
                    cell.designation.isHidden = false
                    var po=emparr[indexPath.row] as? NSMutableDictionary
                    var firstname = po!["firstname"] as? String
                    cell.emplnameOutlet.text=firstname
                    cell.emplnameOutlet.sizeToFit()
                    cell.useridoutlet.text=po!["userid"] as? String
                    cell.useridoutlet.sizeToFit()
                    cell.lastnameOutlet.text=po!["lastname"] as? String
                    cell.lastnameOutlet.sizeToFit()
                    cell.contactOutlet.text=po!["contact"] as? String
                    cell.contactOutlet.sizeToFit()
                    cell.designationOutlet.text=po!["designation"] as? String
                    cell.designationOutlet.sizeToFit()
                    ui = cell.useridoutlet.text!
                    fn = cell.emplnameOutlet.text!
                    ln = cell.lastnameOutlet.text!
                    cont1 = cell.contactOutlet.text!
                    de1 = cell.designationOutlet.text!
                    cell.category.isHidden=true
                    cell.categoryOutlet.isHidden=true
                    
                   
                    
                }
                else if segmentOutlet.selectedSegmentIndex == 1{
                    var po=staffarr[indexPath.row] as? NSMutableDictionary
                    var firstname = po!["firstname"] as? String
                    cell.category.isHidden=false
                    cell.categoryOutlet.isHidden=false
                    cell.emplnameOutlet.text=firstname
                    cell.emplnameOutlet.sizeToFit()
                    cell.useridoutlet.text=po!["userid"] as? String
                    cell.useridoutlet.sizeToFit()
                    cell.lastnameOutlet.text=po!["lastname"] as? String
                    cell.lastnameOutlet.sizeToFit()
                    cell.contactOutlet.text=po!["contact"] as? String
                    cell.contactOutlet.sizeToFit()
                    cell.designationOutlet.text=po!["designation"] as? String
                    cell.designationOutlet.sizeToFit()
                    cell.categoryOutlet.text = po!["category"] as? String
                    
                    ui = cell.useridoutlet.text!
                    fn = cell.emplnameOutlet.text!
                    ln = cell.lastnameOutlet.text!
                    cont1 = cell.contactOutlet.text!
                    de1 = cell.designationOutlet.text!
                    cell.designation.isHidden=true
                    cell.designationOutlet.isHidden=true
                    
                    
                }
                else if segmentOutlet.selectedSegmentIndex == 2{
                    var po=mngarr[indexPath.row] as? NSMutableDictionary
                    var firstname = po!["firstname"] as? String
                    cell.emplnameOutlet.text = firstname
                    cell.emplnameOutlet.sizeToFit()
                    cell.useridoutlet.text=po!["userid"] as? String
                    cell.useridoutlet.sizeToFit()
                    cell.lastnameOutlet.text=po!["lastname"] as? String
                    cell.lastnameOutlet.sizeToFit()
                    cell.contactOutlet.text=po!["contact"] as? String
                    cell.contactOutlet.sizeToFit()
                    cell.designationOutlet.text=po!["designation"] as? String
                    cell.designationOutlet.sizeToFit()
                    ui = cell.useridoutlet.text!
                    fn = cell.emplnameOutlet.text!
                    ln = cell.lastnameOutlet.text!
                    cont1 = cell.contactOutlet.text!
                    de1 = cell.designationOutlet.text!
                    cell.designation.isHidden = true
                    cell.designationOutlet.isHidden = true
                    cell.categoryOutlet.isHidden = true
                    cell.category.isHidden = true
                    
                }
            
            return cell
        }
    }

    
    @IBAction func updateAction(_ sender: Any) {
        var storyboard=UIStoryboard(name: "Main", bundle: nil)
        var finalVC = storyboard.instantiateViewController(withIdentifier: "finalVC") as? finalupdateViewController
        finalVC?.prev1=self
        if desigFlag == 1{
            finalVC?.tempDesigFlag = 1
        }
        
        self.show(finalVC!, sender: nil)
        if segmentOutlet.selectedSegmentIndex == 0{
//            var p2=emparr[index1!] as? NSMutableDictionary
//            finalVC?.firstnameOutlet.text = p2!["firstname"] as! String
            var p2 = emparr[index1!] as! NSMutableDictionary
            finalVC?.firstnameOutlet.text = p2["firstname"] as! String
            finalVC?.lastnameOutlet.text = p2["lastname"] as! String
            finalVC?.contactOutlet.text = p2["contact"] as! String
            finalVC?.useridOutlet.text = p2["userid"] as! String
            finalVC?.designationOutlet.text = p2["designation"] as! String
        }
       else if segmentOutlet.selectedSegmentIndex == 1{
            var p2 = staffarr[index1!] as! NSMutableDictionary
            finalVC?.firstnameOutlet.text = p2["firstname"] as! String
            finalVC?.lastnameOutlet.text = p2["lastname"] as! String
            finalVC?.contactOutlet.text = p2["contact"] as! String
            finalVC?.useridOutlet.text = p2["userid"] as! String
            finalVC?.designationOutlet.text = p2["designation"] as! String
        }
        else{
            var p2 = mngarr[index1!] as! NSMutableDictionary
            finalVC?.firstnameOutlet.text = p2["firstname"] as! String
            finalVC?.lastnameOutlet.text = p2["lastname"] as! String
            finalVC?.contactOutlet.text = p2["contact"] as! String
            finalVC?.useridOutlet.text = p2["userid"] as! String
            finalVC?.designationOutlet.text = p2["designation"] as! String
        }
    }
    
  
    
    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        var delVC = storyboard.instantiateViewController(withIdentifier: "delVC") as? deleteuserViewController
        delVC?.prev1=self
        self.show(delVC!, sender: nil)
        if segmentOutlet.selectedSegmentIndex == 0{
            var po=emparr[index1!] as! NSMutableDictionary
            delVC?.firstnameOutlet.text = po["firstname"] as! String
            delVC?.lastnameOutlet.text = po["lastname"] as! String
            delVC?.contactOutlet.text = po["contact"] as! String
            delVC?.useridOutlet.text = po["userid"] as! String
        }
        else if segmentOutlet.selectedSegmentIndex == 1{
            var po=staffarr[index1!] as! NSMutableDictionary
            delVC?.firstnameOutlet.text = po["firstname"] as! String
            delVC?.lastnameOutlet.text = po["lastname"] as! String
            delVC?.contactOutlet.text = po["contact"] as! String
            delVC?.useridOutlet.text = po["userid"] as! String
        }
        else{
            var po=mngarr[index1!] as! NSMutableDictionary
            delVC?.firstnameOutlet.text = po["firstname"] as! String
            delVC?.lastnameOutlet.text = po["lastname"] as! String
            delVC?.contactOutlet.text = po["contact"] as! String
            delVC?.useridOutlet.text = po["userid"] as! String
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateOutlet.isEnabled = true
        deleteOutlet.isEnabled = true
        var srow=indexPath.row
        
        index1 = indexPath.row
        print("OIUYGHJNBVCFGHU:",index1)
    }
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        print("Data: \(String.init(data: data, encoding: .ascii))")
        do{
            flag = 1
            getData_Admin = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSMutableArray
            //print(getData)
            var qw=NSMutableArray(array: getData_Admin!)
            for i in qw{
                var p = i as! NSMutableDictionary
                print(p.value(forKey: "userid"))
            }
          
            print("after loading")
            split()
              tableView.reloadData()
        }
        catch{
            print("catch executed")
        }
        
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

