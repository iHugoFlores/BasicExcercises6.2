//
//  ResponseModel.swift
//  JSONSerializationSwift
//
//  Created by Field Employee on 3/31/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

struct ResponseModel: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    let latitude: Double
    let longitude: Double
    let timezone: String
}
