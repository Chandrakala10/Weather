//
//  Weather+Service.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

/// JSON dictionary.
public typealias JSON = [String: AnyObject]

extension Weather {
    public init(weatherResponse: JSON, type: ServiceAPIType) throws {
        // parse JSON response 
        self = Weather(temp: "", location: "", weather: "")
    }
}
