//
//  WeatherManager.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
import Alamofire

class WeatherManager {
    lazy var weatherService = WeatherService()
    
    var locationsWeather = [String: Weather]()
    
    // TODO: Add logic to check in locationsWeather array befor making service call
    func loadWeather(latitude lat: Double, longitude lon:Double,  completion: @escaping (Result<Void>) -> Void) {
        let type = ServiceAPIType.geoLocation(lat, lon)
        weatherService.downloadWeatherData(type: type) { [weak self] result in
            switch result {
            case .success(let weather) :
                self?.locationsWeather[type.query()] = weather
                completion(.success())
            case .failure(let error):
                // TODO: Need to assign ServiceError
                completion(.failure(error))
            }
        }
    }
    
    func query(latitude lat:Double, longitude lon:Double) -> String {
        return ServiceAPIType.geoLocation(lat, lon).query()
    }
}
