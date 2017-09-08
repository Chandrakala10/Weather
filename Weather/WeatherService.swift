//
//  WeatherService.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation

enum ServiceAPIType {
    case geoLocation(String, String)
    case cityID(String)
    case city(String)
}
protocol WeatherService {
    
    static var baseURL: String { get }
    func downloadWeatherData(type:ServiceAPIType, completed: @escaping ()-> ())
}
