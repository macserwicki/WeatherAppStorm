//
//  WeatherDataModel.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 2/29/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    private var _temperature: Int?
    private var _humidityLevel: Int?
    private var _precipitationProbability: Int?
    private var _summaryOfWeather: String?
    
    
    var temperature: Int? {
        return _temperature
    }
    
    var humidityLevel: Int? {
        return _humidityLevel
    }
    
    var precipitationProbability: Int? {
        return _precipitationProbability
    }
    
    var summaryOfWeather: String? {
        return _summaryOfWeather
    }
    
    
    
    
    
    init (dict: Dictionary<String, AnyObject>) {
        
        if let currentWeatherData = dict["currently"] as? Dictionary<String, AnyObject> {
            
            if let summary = currentWeatherData["summary"] as? String {
                _summaryOfWeather = summary
            }
            
            if let humidity = currentWeatherData["humidity"] as? Int {
                _humidityLevel = humidity
            }
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}