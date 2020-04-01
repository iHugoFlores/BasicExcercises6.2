//
//  WeatherHourData.swift
//  JSONSerializationSwift
//
//  Created by Field Employee on 4/1/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

public struct WeatherHourData: JSONDecodable {
    public let time: Date
    public let windSpeed: Int
    public let temperature: Double
    public let precipitation: Double

    public init(time: Date, windSpeed: Int, temperature: Double, precipitation: Double) {
        self.time = time
        self.windSpeed = windSpeed
        self.temperature = temperature
        self.precipitation = precipitation
    }
    
    init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else { return nil }
        guard let time = JSON["time"] as? Double else { return nil }
        guard let windSpeed = JSON["windSpeed"] as? Int else { return nil }
        guard let temperature = JSON["temperature"] as? Double else { return nil }
        guard let precipitation = JSON["precipIntensity"] as? Double else { return nil }

        self.windSpeed = windSpeed
        self.temperature = temperature
        self.precipitation = precipitation
        self.time = Date(timeIntervalSince1970: time)
    }
}
