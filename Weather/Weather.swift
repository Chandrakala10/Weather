//
//  Weather.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

public struct Weather {
    
    public let temperature: String
    public let location: String
    public let description: String
    
    public init(temperature: String,
                location: String,
                weather: String) {
        self.temperature = temperature
        self.location = location
        self.description = weather
    }
}
