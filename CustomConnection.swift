//
//  CustomConnection.swift
//  IF_Employee
//
//  Created by gec on 02/03/20.
//  Copyright © 2020 gec. All rights reserved.
//

import UIKit

class CustomConnection: NSURLConnection, NSURLConnectionDataDelegate {
    static func toServer(_ dict : NSMutableDictionary, _ partURL : String, _ vc : UIViewController){
        var serverData:Data?
        do {
            serverData = try JSONSerialization.data(withJSONObject: dict, options: .init(rawValue: 0))
            let dataString = String.init(data: serverData!, encoding: String.Encoding.ascii)
            print("Data as String: ",dataString)
        }
        catch {
            print("Failed to convert the object to raw data format")
        }
        let url = URL.init(string: "http://localhost:8080/WebApplication2/Controller/\(partURL)")
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serverData
        print(request.allHTTPHeaderFields)
        let connection = NSURLConnection(request: request, delegate: vc)
        print("POLOER")
        connection?.start()
        
    }

}
