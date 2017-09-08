//
//  Weather+Service.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

extension Weather {
    
    /// JSON keys.
    private enum Keys {
        static let main = "main"
        static let weather = "weather"
        static let country = "country"
        static let temp = "temp"
        static let name = "name"
        static let sys = "sys"
    }
    
    public init(weatherResponse payload: JSON, type: ServiceAPIType) throws {
        
        // parse JSON response
        guard let main = payload[Keys.main] as? JSON else { throw JSONError.error(forKey: Keys.main, json: payload) }
        guard let tempKelvins = main[Keys.temp] as? Double else { throw JSONError.error(forKey: Keys.temp, json: payload) }
        guard let name = payload[Keys.name] as? String else { throw JSONError.error(forKey: Keys.name, json: payload) }
        guard let sys = payload[Keys.sys] as? JSON else { throw JSONError.error(forKey: Keys.sys, json: payload) }
        guard let country = sys[Keys.country] as? String else { throw JSONError.error(forKey: Keys.country, json: payload) }
        guard let weatherArray = payload[Keys.weather] as? JSONArray,
            let weather = weatherArray.first else { throw JSONError.error(forKey: Keys.weather, json: payload) }
        guard let description = weather[Keys.main] as? String else { throw JSONError.error(forKey: Keys.main, json: payload) }
        
        self = Weather(temp: String(format: "%.0f °C", tempKelvins - 273.15), location: name+", "+country, weather: description)
    }
}
