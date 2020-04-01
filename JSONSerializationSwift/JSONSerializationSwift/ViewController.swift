//
//  ViewController.swift
//  JSONSerializationSwift
//
//  Created by Field Employee on 3/31/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDict = JSONUtil.readJSONAsStringMap()
        print(jsonDict)
        //print(jsonDict["currently"]!, type(of: jsonDict["currently"]!))
        //let curretntly = jsonDict["currently"] as! Dictionary<String, Any>
        //print(curretntly["summary"])
        
        let jsonModel = JSONUtil.readJSONAsModel()
        print(jsonModel!)
    }


}

