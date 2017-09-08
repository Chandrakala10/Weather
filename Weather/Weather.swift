//
//  Weather.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
public struct Weather {
    
    public let temp: String
    public let location: String
    public let weather: String
    
    public init(temp: String,
                location: String,
                weather: String) {
        self.temp = temp
        self.location = location
        self.weather = weather
    }
}
