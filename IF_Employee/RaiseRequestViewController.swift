//
//  RaiseRequestViewController.swift
//  IF_Employee
//
//  Created by gec on 23/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit



class RaiseRequestViewController: UIViewController,NSURLConnectionDataDelegate {
    
    var serverData:Data?
   
    var tempBuildingName = ""
    var tempEccNo = ""
    var tempCabinNo = ""
    var tempFloor = ""
    @IBOutlet var descriptionOutlet: UITextView!
    @IBOutlet var floorNoOutlet: UITextField!
    @IBOutlet var classRoomOutlet: UITextField!
    @IBOutlet var cabinNoOutlet: UITextField!
    @IBOutlet var eccNoOutlet: UITextField!
    @IBOutlet var buildingNo: UITextField!
    @IBOutlet var categorySegment: UISegmentedControl!
    
    var requestStatus = "Pending"
    var flag = 0
    
    var categoryName:String = "Housekeeping"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryName = "Housekeeping"
        buildingNo.isEnabled = true
        cabinNoOutlet.isEnabled = true
        eccNoOutlet.isEnabled = false
        classRoomOutlet.isEnabled = false
        
        cabinNoOutlet.placeholder = "Cabin no"
        buildingNo.placeholder = "Building name"
        eccNoOutlet.placeholder = "ECC No"
        floorNoOutlet.placeholder = "Floor no"
        classRoomOutlet.placeholder = "Room No"
        
//        buildingNo.text = "NA"
//        eccNoOutlet.text = "NA"
//        cabinNoOutlet.text = "NA"
//        classRoomOutlet.text = "NA"
        

        
        // Do any additional setup after loading the view.
    }
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BuildingNameAction(_ sender: UIButton) {
        eccNoOutlet.isEnabled = false
        buildingNo.isEnabled = true
        eccNoOutlet.text = ""
        buildingNo.text = ""
        eccNoOutlet.backgroundColor = UIColor.gray
        buildingNo.backgroundColor = UIColor.white
        
        
    }
    
    @IBAction func EccAction(_ sender: UIButton) {
        eccNoOutlet.isEnabled = true
        buildingNo.isEnabled = false
        buildingNo.text = ""
        eccNoOutlet.text = ""
        eccNoOutlet.backgroundColor = UIColor.white
        buildingNo.backgroundColor = UIColor.gray
      
       }
    
    @IBAction func cabinAction(_ sender: Any) {
        cabinNoOutlet.isEnabled = true
        classRoomOutlet.isEnabled = false
        classRoomOutlet.text = ""
        cabinNoOutlet.text = ""
        cabinNoOutlet.backgroundColor = UIColor.white
        classRoomOutlet.backgroundColor = UIColor.gray
        
    }
    
    @IBAction func roomAction(_ sender: UIButton) {
        cabinNoOutlet.isEnabled = false
        classRoomOutlet.isEnabled = true
        cabinNoOutlet.text = ""
        classRoomOutlet.text = ""
        cabinNoOutlet.backgroundColor = UIColor.gray
        classRoomOutlet.backgroundColor = UIColor.white
        
        
    }
    
    
    @IBAction func categoryAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            categoryName = "Housekeeping"
//            buildingNo.isEnabled = false
//            eccNoOutlet.isEnabled = true
//            cabinNoOutlet.isEnabled = false
//            classRoomOutlet.isEnabled = true
//            floorNoOutlet.isEnabled = true
//            cabinNoOutlet.placeholder = "NA"
//            buildingNo.placeholder = "NA"
//            eccNoOutlet.placeholder = "ECC No"
//            floorNoOutlet.placeholder = "Floor no"
//            classRoomOutlet.placeholder = "Room No"
//            tempBuildingName = "NA"
//            tempCabinNo = "NA"


            }
        else if sender.selectedSegmentIndex == 1{
            categoryName = "Electrical"
//            buildingNo.isEnabled = true
//            eccNoOutlet.isEnabled = true
//            cabinNoOutlet.isEnabled = true
//            classRoomOutlet.isEnabled = true
//            floorNoOutlet.isEnabled = true
//            buildingNo.placeholder = "Building Name"
//            eccNoOutlet.placeholder = "ECC No"
//            floorNoOutlet.placeholder = "Floor no"
//            classRoomOutlet.placeholder = "Room No"
//            cabinNoOutlet.placeholder = "Cabin No"


        }
        else {
            categoryName = "Stationary"
//            buildingNo.isEnabled = true
//            classRoomOutlet.isEnabled = true
//            cabinNoOutlet.isEnabled = false
//            eccNoOutlet.isEnabled = false
//            floorNoOutlet.isEnabled = false
//            buildingNo.placeholder = "Building Name"
//            classRoomOutlet.placeholder = "Room No"
//            eccNoOutlet.placeholder = "NA"
//            floorNoOutlet.placeholder = "NA"
//            cabinNoOutlet.placeholder = "NA"
//            tempEccNo = "NA"
//            tempCabinNo = "NA"
//            tempFloor = "NA"
        }

        
    }
    
    
    @IBAction func logoutAction(_ sender: UIButton) {
        alert100(vc: self)
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("Loaded")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        print("Data: \(String.init(data: data, encoding: .ascii))")
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        print("Response")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }
    
    @IBAction func RaiseRequestAction(_ sender: UIButton) {
       
       
        let dict = NSMutableDictionary()

//            if self.categoryName == "Housekeeping"{
//                if (self.eccNoOutlet.text?.isEmpty)! || (self.self.classRoomOutlet.text?.isEmpty)! || (self.floorNoOutlet.text?.isEmpty)! || self.descriptionOutlet.text.isEmpty{
//                            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
//                            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
//                            alert.addAction(button)
//                            self.present(alert, animated: true, completion: nil)
//
//            }else{
//                    self.flag = 1
//            }
//        }
        if buildingNo.isEnabled && (buildingNo.text?.isEmpty)!{
            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
                                        var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
                                        alert.addAction(button)
                                        self.present(alert, animated: true, completion: nil)
        }
        else if eccNoOutlet.isEnabled && (eccNoOutlet.text?.isEmpty)!{
            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        else if cabinNoOutlet.isEnabled && (cabinNoOutlet.text?.isEmpty)!{
            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        else if classRoomOutlet.isEnabled && (classRoomOutlet.text?.isEmpty)!{
            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        } else if (floorNoOutlet.text?.isEmpty)! || descriptionOutlet.text.isEmpty{
            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if descriptionOutlet.text.count > 200{
            alert(msg: "Length of description cannot exceed 200 characters ", info: "", vc: self)
        }
        
        else{
            self.flag = 1
        }
//
//                if self.descriptionOutlet.text.isEmpty || (self.floorNoOutlet.text?.isEmpty)! || (self.classRoomOutlet.text?.isEmpty)! || (self.cabinNoOutlet.text?.isEmpty)! || (self.eccNoOutlet.text?.isEmpty)! || (self.buildingNo.text?.isEmpty)!{
//                            var alert = UIAlertController(title: "Please enter all the text fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
//                            var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
//                            alert.addAction(button)
//                            self.present(alert, animated: true, completion: nil)
//            }else{
//                    self.flag = 1
//        }
//        }else{
//                if (self.buildingNo.text?.isEmpty)! || (self.classRoomOutlet.text?.isEmpty)! || self.descriptionOutlet.text.isEmpty{
//                var alert = UIAlertController(title: "Please enter all the enabled fields ", message: "If Invalid field,just enter NA", preferredStyle: .alert)
//                var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
//                alert.addAction(button)
//                self.present(alert, animated: true, completion: nil)
//            }else{
//                    self.flag = 1
//            }
//        }
            if self.flag == 1{
                if (buildingNo.text?.isEmpty)!{
                    buildingNo.text = "NA"
                }
                if (eccNoOutlet.text?.isEmpty)!{
                    eccNoOutlet.text = "NA"
                }
                if (cabinNoOutlet.text?.isEmpty)! {
                    cabinNoOutlet.text = "NA"
                }
                if (classRoomOutlet.text?.isEmpty)!{
                    classRoomOutlet.text = "NA"
                }
                
                
                
                
//                if categoryName == "Housekeeping"{
                    dict.setValue(self.descriptionOutlet.text, forKey: "description")
                    dict.setValue(AdminViewController.EmployeeId, forKey: "userid")
                    dict.setValue(self.categoryName, forKey: "category")
                    dict.setValue(self.floorNoOutlet.text, forKey: "floor")
                    dict.setValue(self.classRoomOutlet.text, forKey: "roomno")
                    dict.setValue(cabinNoOutlet.text, forKey: "cabinno")
                    dict.setValue(self.eccNoOutlet.text, forKey: "eccno")
                    dict.setValue(buildingNo.text, forKey: "buildingNo")
                    
                    dict.setValue(self.requestStatus, forKey: "status")
                    dict.setValue("NA", forKey: "closeddescr")
                    dict.setValue("NA", forKey: "reopendescr")
                    dict.setValue("NA", forKey: "complaintdescr")
                  dict.setValue("NA", forKey: "closedby")
                
                    
//                }
//                else if categoryName == "Stationary"{
//                    dict.setValue(self.descriptionOutlet.text, forKey: "description")
//                    dict.setValue(AdminViewController.EmployeeId, forKey: "userid")
//                    dict.setValue(self.categoryName, forKey: "category")
//                    dict.setValue("NA", forKey: "floor")
//                    dict.setValue(self.classRoomOutlet.text, forKey: "roomno")
//                    dict.setValue("NA", forKey: "cabinno")
//                    dict.setValue("NA", forKey: "eccno")
//                    dict.setValue(self.buildingNo.text, forKey: "buildingNo")
//
//                    dict.setValue(self.requestStatus, forKey: "status")
//                    dict.setValue("NA", forKey: "closeddescr")
//                    dict.setValue("NA", forKey: "reopendescr")
//                    dict.setValue("NA", forKey: "complaintdescr")
//                    dict.setValue("NA", forKey: "closedby")
//                }else{
//                    dict.setValue(self.descriptionOutlet.text, forKey: "description")
//                    dict.setValue(AdminViewController.EmployeeId, forKey: "userid")
//                    dict.setValue(self.categoryName, forKey: "category")
//                    dict.setValue(self.floorNoOutlet.text, forKey: "floor")
//                    dict.setValue(self.classRoomOutlet.text, forKey: "roomno")
//                    dict.setValue(self.cabinNoOutlet.text, forKey: "cabinno")
//                    dict.setValue(self.eccNoOutlet.text, forKey: "eccno")
//                    dict.setValue(self.buildingNo.text, forKey: "buildingNo")
//
//                    dict.setValue(self.requestStatus, forKey: "status")
//                    dict.setValue("NA", forKey: "closeddescr")
//                    dict.setValue("NA", forKey: "reopendescr")
//                    dict.setValue("NA", forKey: "complaintdescr")
//                    dict.setValue("NA", forKey: "closedby")
//                }
                    self.flag = 0
                var alert = UIAlertController(title: "Raise Request ", message: "Success", preferredStyle: .alert)
                var button = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(button)
                self.present(alert, animated: true, completion: nil)
                
             
    
       }
        CustomConnection.toServer(dict, "addRequest", self)
            self.descriptionOutlet.text = ""
            self.classRoomOutlet.text = ""
            self.cabinNoOutlet.text = ""
            self.buildingNo.text = ""
            self.eccNoOutlet.text = ""
            self.descriptionOutlet.text = ""
            self.floorNoOutlet.text = ""
        
    }
    
}
