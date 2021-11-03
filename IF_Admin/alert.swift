//
//  alert.swift
//  project
//
//  Created by gec on 25/02/20.
//  Copyright © 2020 gec. All rights reserved.
//

import Foundation
import UIKit
func alert(msg:String,info:String,vc:UIViewController){
   var alert=UIAlertController(title: msg, message: info, preferredStyle: .alert)
    var button = UIAlertAction(title: "ok", style: .cancel, handler: nil)
    alert.addAction(button)
   vc.show(alert, sender: nil)
}
func alert1(msg:String,info:String,vc:UIViewController){
    var alert=UIAlertController(title: msg, message: info, preferredStyle: .alert)
    var button = UIAlertAction(title: "ok", style: .cancel, handler: nil)
    alert.addAction(button)
    vc.present(alert, animated: true, completion: nil)
}

func alert100(vc:UIViewController){
    var alert=UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
    var button2 = UIAlertAction(title: "OK", style: .default) { (_) in
        vc.dismiss(animated: true, completion: nil)
    }
    alert.addAction(button2)
    var button1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(button1)
    vc.present(alert, animated: true, completion: nil)
}


