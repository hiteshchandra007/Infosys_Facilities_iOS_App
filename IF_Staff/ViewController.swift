//
//  ViewController.swift
//  JDBCiOS
//
//  Created by S&V on 18/06/18.
//  Copyright © 2018 S&V. All rights reserved.
//

import UIKit
var usercredential = ""
class ViewController: UIViewController,  NSURLConnectionDataDelegate {
    
    var serverData:Data?
    
    @IBOutlet var usernameOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dict = NSMutableDictionary()
//        dict.setValue(usernameOutlet.text, forKey: "username")
//        dict.setValue("12345gklh6", forKey: "password")
        do {
            serverData = try JSONSerialization.data(withJSONObject: dict, options: .init(rawValue: 0))
            let dataString = String.init(data: serverData!, encoding: String.Encoding.ascii)
            print("Data as String: ",dataString)
        }
        catch {
            print("Failed to convert the object to raw data format")
        }
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        let url = URL.init(string: "http://localhost:8080/WebApplication1/Controller/validateLogin")
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serverData
        print(request.allHTTPHeaderFields)
        let connection = NSURLConnection(request: request, delegate: self)
        connection?.start()
        usercredential = usernameOutlet.text!
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
}

