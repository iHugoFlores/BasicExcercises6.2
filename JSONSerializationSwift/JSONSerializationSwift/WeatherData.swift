//
//  WeatherData.swift
//  JSONSerializationSwift
//
//  Created by Field Employee on 4/1/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init?(JSON: Any)
}

struct WeatherData: JSONDecodable {
    public let lat: Double
    public let long: Double

    public let hourData: [WeatherHourData]

    public init(lat: Double, long: Double, hourData: [WeatherHourData]) {
        self.lat = lat
        self.long = long
        self.hourData = hourData
    }
    
    init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else {return nil}
        guard let lat = JSON["latitude"] as? Double else {return nil }
        guard let long = JSON["longitude"] as? Double else {return nil }
        guard let hourlyData = JSON["hourly"]?["data"] as? [[String: AnyObject]] else { return nil }

          self.lat = lat
          self.long = long

          var buffer = [WeatherHourData]()

          for hourlyDataPoint in hourlyData {
              if let weatherHourData = WeatherHourData(JSON: hourlyDataPoint) {
                  buffer.append(weatherHourData)
              }
          }
          self.hourData = buffer
    }
}
