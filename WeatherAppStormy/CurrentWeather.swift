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
        
        _forecastedDays = []
        
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
                //do this after tableview is complete
                //tapping on "current weather" opens hourly
                
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
                        
                        var _futureTime: Int!
                        var _futureSummary: String!
                        var _futureIcon: String!
                        var _futurePrecipType: String!
                        var _futurePrecipProb: Double!
                        var _futureTempMin: Double!
                        var _futureTempMax: Double!
                        var _futureHumidityLevel: Double!
                        var _futureWindSpeed: Double!
                        var _futureSunriseTime: Int!
                        var _futureSunsetTime: Int!
                        
                        if let futureTime = day["time"] as? Int {
                            _futureTime = futureTime
                            print(futureTime)
                        } else {
                            _futureTime = 0
                        }
                        
                        if let futureSummary = day["summary"] as? String {
                            _futureSummary = futureSummary
                            print(futureSummary)
                        } else {
                            _futureSummary = ""
                        }
                        
                        if let futureIcon = day["icon"] as? String {
                            _futureIcon = futureIcon
                            print(futureIcon)
                        } else {
                            _futureIcon = ""
                        }
                        
                        if let futurePrecipType = day["precipType"] as? String {
                            _futurePrecipType = futurePrecipType
                            print(futurePrecipType)
                        } else {
                            _futurePrecipType = ""
                        }
                        
                        if let futurePrecipProb = day["precipProbability"] as? Double {
                            _futurePrecipProb = futurePrecipProb
                            print(futurePrecipProb)
                        } else {
                            _futurePrecipProb = 0
                        }
                        
                        if let futureTempMin = day["temperatureMin"] as? Double {
                            _futureTempMin = futureTempMin
                            print(futureTempMin)
                        } else {
                            _futureTempMin = 0
                        }
                        
                        if let futureTempMax = day["temperatureMax"] as? Double {
                            _futureTempMax = futureTempMax
                            print(futureTempMax)
                        } else {
                            _futureTempMax = 0
                        }
                        
                        
                        if let futureHumidityLevel = day["humidity"] as? Double {
                            _futureHumidityLevel = futureHumidityLevel
                            print(futureHumidityLevel)
                        } else {
                            _futureHumidityLevel = 0
                        }
                        
                        if let futureWindSpeed = day["windSpeed"] as? Double {
                            _futureWindSpeed = futureWindSpeed
                            print(futureWindSpeed)
                        } else {
                            _futureWindSpeed = 0
                        }
                        
                        if let futureSunriseTime = day["sunriseTime"] as? Int {
                            _futureSunriseTime = futureSunriseTime
                            print(futureSunriseTime)
                        } else {
                            _futureSunriseTime = 0
                        }
                        
                        if let futureSunsetTime = day["sunsetTime"] as? Int {
                            _futureSunsetTime = futureSunsetTime
                            print(futureSunsetTime)
                        } else {
                            _futureSunsetTime = 0
                        }
                        
                        //init a new class
                        //append class to array for cell for row use
                        
                        print("We got to the future loop")
                        
                        let newWeather = FutureWeather.init(futureTimeInit: _futureTime, futureSummaryInit: _futureSummary, futureIconInit: _futureIcon, futurePrecipTypeInit: _futurePrecipType, futurePrecipProbInit: _futurePrecipProb, futureTempMinInit: _futureTempMin, futureTempMaxInit: _futureTempMax, futureHumidityLevelInit: _futureHumidityLevel, futureWindSpeedInit: _futureWindSpeed, futureSunriseTimeInit: _futureSunriseTime, futureSunsetTimeInit: _futureSunsetTime)
                        
                        print(_futureSummary)
                        print("we got here 3 - \(_futureTempMax)")
                        
                        _forecastedDays!.append(newWeather)
                        
                        
                    }
                    
                }
                
            }
    
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}