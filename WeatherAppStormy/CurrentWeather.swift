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
    private var _date: NSDate?
    
    private var _dailySummary: String?
    private var _dailyIcon: String?
    
    private var _forecastedDays: [FutureWeather]?
    
    
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
    
    var date: NSDate? {
        return _date
    }
    
    var dailySummary: String? {
        return _dailySummary
    }
    
    var dailyIcon: String? {
        return _dailyIcon
    }
    
    var forecastedWeather: [FutureWeather]? {
        return _forecastedDays
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
            
            if let dateInSeconds = currentWeatherData["time"] as? Int {
                let timeInterval: NSTimeInterval = Double(dateInSeconds)
                let dateFromInterval = NSDate(timeIntervalSince1970: timeInterval)
                print("Date: \(dateFromInterval)")
                _date = dateFromInterval
            }
            
            if let hourly = dict["hourly"] as? Dictionary<String, AnyObject>  {
                
                //hourly forecast data
                
            }
            
            if let daily = dict["daily"] as? Dictionary<String, AnyObject>  {
                
                if let dailyWeatherSummary = daily["summary"] as? String {
                    _dailySummary = dailyWeatherSummary
                }
                
                if let dailyIconName = daily["icon"] as? String {
                    _icon = dailyIconName
                }
                
                if let dailyWeekData = daily["data"] as? [Dictionary<String, AnyObject>] {
                    
                    for day in dailyWeekData {
                        
                        var summString = ""
                        
                        if let futureTime = day["time"] as? Double {
                            print(futureTime)
                        }
                        
                        if let futureSummary = day["summary"] as? String {
                            summString = futureSummary
                            print(futureSummary)
                        }
                        
                        if let futureIcon = day["icon"] as? String {
                            print(futureIcon)
                        }
                        
                        if let futurePrecipType = day["precipType"] as? String {
                            print(futurePrecipType)
                        }
                        
                        if let futurePrecipProb = day["precipProbability"] as? Double {
                            print(futurePrecipProb)
                        }
                        
                        if let futureTempMin = day["temperatureMin"] as? Double {
                            print(futureTempMin)
                        }
                        
                        if let futureTempMax = day["temperatureMax"] as? Double {
                            print(futureTempMax)
                        }
                        
                        if let futureHumidityLevel = day["humidity"] as? Double {
                            print(futureHumidityLevel)
                        }
                        
                        if let futureWindSpeed = day["windSpeed"] as? Double {
                            print(futureWindSpeed)
                        }
                        
                        if let futureSunriseTime = day["sunriseTime"] as? Int {
                            print(futureSunriseTime)
                        }
                        
                        if let futureSunsetTime = day["sunsetTime"] as? Int {
                            print(futureSunsetTime)
                        }
                        
                        //init a new class
                        //append class to array for cell for row use
                        
                        print("We got to the future loop")
                        
                        let newWeather = FutureWeather(descriptionString: summString)
                        
                        _forecastedDays?.append(newWeather)
                        
                        
                    }
                    
                }
                
            }
    
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}