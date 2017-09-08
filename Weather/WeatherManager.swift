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
    
    func downloadWeatherData(type:ServiceAPIType, completed: @escaping ()-> ()) {
        switch type {
        case .geoLocation(let lat, let lon):
            let url = URL(string:WeatherManager.baseURL+"lat=\(lat)&lon=\(lon)&appid="+WeatherManager.apiKey)!
            Alamofire.request(url).responseJSON {
                response in
                let result = response.result
                print(result)
            }
        default:
            break
        }
    }
}
