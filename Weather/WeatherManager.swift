//
//  WeatherManager.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
import Alamofire

class WeatherManager: WeatherService {
    static var baseURL: String {
        return "http://api.openweathermap.org/data/2.5/weather?"
    }
    
    static var apiKey: String {
        return "8e4b0aff9275ed52851bbf4c6522b405"
    }
    // Weather Information array used for offline storage
    var locationsWeather = [String: Weather]()
    
    // TODO: Add logic to check in locationsWeather array befor making service call
    func downloadWeatherData(type:ServiceAPIType, completion: @escaping WeatherServiceCallback) {
        switch type {
        case .geoLocation(let lat, let lon):
            let geoCode = "lat=\(lat)&lon=\(lon)"
            let url = URL(string:WeatherManager.baseURL+geoCode+"&appid="+WeatherManager.apiKey)!
            Alamofire.request(url).responseJSON { [weak self]
                response in
                switch response.result {
                case .success(let value) :
                    if let json = value as? JSON {
                        do {
                            let weather = try Weather(weatherResponse: json, type: type)
                            self?.locationsWeather[geoCode] = weather
                            completion(.success(weather))
                        } catch (let error) {
                            completion(.failure(error))
                        }
                    }
                    else {
                        completion(.failure(ServiceError.invalidJSON))
                    }
                case .failure(let error):
                    // TODO: Need to assign ServiceError
                    completion(.failure(error))
                }
            }
        default:
            break
        }
    }
}
