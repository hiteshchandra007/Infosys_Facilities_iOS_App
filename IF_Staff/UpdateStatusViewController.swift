//
//  UpdateStatusViewController.swift
//  JDBCiOS
//
//  Created by gec on 28/02/20.
//  Copyright © 2020 S&V. All rights reserved.
//

import UIKit

class UpdateStatusViewController: UIViewController , NSURLConnectionDataDelegate{

    @IBOutlet var progress: UILabel!
    @IBOutlet var progressOutlet: UITextView!
    
    @IBOutlet var remarksOutlet: UITextView!
    
    
    @IBOutlet var remarks: UILabel!
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var closedButton: UIButton!
    var saveFlag = 0
    var closeFlag = 0
    
    var serverData:Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.isHidden = true
        progressOutlet.isHidden = true
        remarksOutlet.isHidden = true
        remarks.isHidden = true
        saveButton.isHidden = true
        closedButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateProgressAction(_ sender: UIButton) {
        progress.isHidden = false
        progressOutlet.isHidden = false
        saveButton.isHidden = false
        remarksOutlet.isHidden = true
        remarks.isHidden = true
        closedButton.isHidden = true
    }
    
  
    @IBAction func closetherequestAction(_ sender: UIButton) {
        remarksOutlet.isHidden = false
        remarks.isHidden = false
        closedButton.isHidden = false
        progress.isHidden = true
        progressOutlet.isHidden = true
        saveButton.isHidden = true
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        if progressOutlet.text.count == 0{
            alert1(msg: "Invalid", info: "Please enter present status of the request", vc: self)
        }else{
            if progressOutlet.text.count > 200{
                alert(msg: "Length of Progress cannot exceed 200 characters ", info: "", vc: self)
                progressOutlet.text = ""
            }else{
                saveFlag = 1
                let dict = NSMutableDictionary()
                dict.setValue(progressOutlet.text, forKey: "progress")
                //        dict.setValue(progressOutlet.text, forKey: "reqid")
                dict.setValue(allocaterequestdetailasViewController.updateforreqid, forKey: "reqid")
                CustomConnection.toServer(dict, "updateProgress", self)
                //        closedButton.isHidden=true
                //        remarksOutlet.isHidden=true
                //        remarks.isHidden=true
                alert1(msg: "Don!", info: "Present progress of the work is updated", vc: self)
            }
            
        }
        
        
        

    }
    
    @IBAction func closedAction(_ sender: UIButton) {
        if remarksOutlet.text.count == 0{
            alert1(msg: "Invalid", info: "Please enter the closing description", vc: self)
        }else{
            if remarksOutlet.text.count > 200{
                alert(msg: "Length of remarks cannot exceed 200 characters ", info: "", vc: self)
                remarksOutlet.text = ""
            }else{
                closeFlag = 1
                let dict = NSMutableDictionary()
                dict.setValue(remarksOutlet.text, forKey: "closeddescr")
                dict.setValue(allocaterequestdetailasViewController.updateforreqid, forKey: "reqid")
                
                dict.setValue(AdminViewController.usercredential, forKey: "closedby")
                CustomConnection.toServer(dict, "updateStatus", self)
                alert1(msg: "Done!", info: "Request is closed", vc: self)
                //        progressOutlet.isHidden = true
                //        saveButton.isHidden = true
                //        progress.isHidden=true
            }
            
            
        }
       
    }
    
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        if closeFlag == 1{
            alert1(msg: "Success", info: "Request has been closed succesfully", vc: self)
        }else if saveFlag == 1{
            alert1(msg: "Success", info: "Progress has been updated succesfully", vc: self)
        }
        
        print("Data: \(String.init(data: data, encoding: .ascii))")
        
        
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
