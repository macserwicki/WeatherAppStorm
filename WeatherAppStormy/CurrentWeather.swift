//
//  WeatherDataModel.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 2/29/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    private var _temperature: Double?
    private var _humidityLevel: Double?
    private var _precipitationProbability: Double?
    private var _summaryOfWeather: String?
    private var _icon: String?
    private var _windSpeed: Double?
    
    var temperature: Double? {
        return _temperature
    }
    
    var humidityLevel: Double? {
        return _humidityLevel
    }
    
    var precipitationProbability: Double? {
        return _precipitationProbability
    }
    
    var summaryOfWeather: String? {
        return _summaryOfWeather
    }
    
    var icon: String? {
        return _icon
    }
    
    var windSpeed: Double? {
        return _windSpeed
    }
    
    
    init (dict: Dictionary<String, AnyObject>) {
        
        if let currentWeatherData = dict["currently"] as? Dictionary<String, AnyObject> {
            
            if let summary = currentWeatherData["summary"] as? String {
                _summaryOfWeather = summary
            }
            
            if let humidity = currentWeatherData["humidity"] as? Double {
                _humidityLevel = humidity
            }
            
            if let precipProbability = currentWeatherData["precipProbability"] as? Double {
                _precipitationProbability = precipProbability
            }
            
            if let summaryOfWeatherString = currentWeatherData["summary"] as? String {
                _summaryOfWeather = summaryOfWeatherString
            }
            
            if let iconName = currentWeatherData["icon"] as? String {
                _icon = iconName
            }
            
            if let windSpeedMPH = currentWeatherData["windSpeed"] as? Double {
                _windSpeed = windSpeedMPH
            }
            
            if let temp = currentWeatherData["temperature"] as? Double {
                _temperature = temp
            }
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}