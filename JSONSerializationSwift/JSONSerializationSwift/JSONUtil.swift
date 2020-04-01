//
//  JSONUtil.swift
//  JSONSerializationSwift
//
//  Created by Field Employee on 3/31/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

class JSONUtil {
    
    static let jsonName = "weather"
    
    static func readRawJSON() -> Data {
        // Fetch URL // normally this would be an API callback response
        let url = Bundle.main.url(forResource: jsonName, withExtension: "json")!
        
        // Load Data
        let data = try! Data(contentsOf: url)
        return data
    }
    
    static func readJSONAsStringMap() -> [String: Any] {
        // Deserialize JSON
        let data = readRawJSON()
        let JSON = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        return JSON
    }
    
    static func readJSONAsModel() -> WeatherData? {
        let data = readJSONAsStringMap()
        if let weatherData = WeatherData(JSON: data) {
            return weatherData
        }
        return nil
    }
}
