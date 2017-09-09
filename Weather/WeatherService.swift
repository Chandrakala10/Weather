//
//  WeatherManager.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService: Service {
    static var baseURL: String {
        return "http://api.openweathermap.org/data/2.5/weather?"
    }
    
    static var apiKey: String {
        return "8e4b0aff9275ed52851bbf4c6522b405"
    }
    
    func downloadWeatherData(type:ServiceAPIType, completion: @escaping WeatherServiceCallback) {
        let url = URL(string:WeatherService.baseURL+type.query()+"&appid="+WeatherService.apiKey)!
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value) :
                if let json = value as? JSON {
                    do {
                        let weather = try Weather(weatherResponse: json, type: type)
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
    }
}
