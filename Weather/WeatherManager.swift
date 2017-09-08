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
        return "api.openweathermap.org/data/2.5/weather?"
    }
    
    func downloadWeatherData(type:ServiceAPIType, completed: @escaping ()-> ()) {
        switch type {
        case .geoLocation(let lat, let lon):
            let url = WeatherManager.baseURL+"lat="+lat+"lon"+lon
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
