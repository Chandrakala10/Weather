//
//  WeatherService.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - Types

public typealias WeatherServiceCallback = (Result<Weather>) -> Void

public enum ServiceAPIType {
    case geoLocation(Double, Double)
    case cityID(String)
    case city(String)
}
protocol WeatherService {
    static var apiKey: String { get }
    static var baseURL: String { get }
    func downloadWeatherData(type:ServiceAPIType, completion: @escaping WeatherServiceCallback)
}
