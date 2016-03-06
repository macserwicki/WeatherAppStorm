//
//  Weather.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 3/2/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import Foundation


class FutureWeather {
    
    private var _futureTime: Int?
    private var _futureDate: String?
    private var _futureSummary: String?
    private var _futureIcon: String?
    private var _futurePrecipType: String?
    private var _futurePrecipProb: Double?
    private var _futureTempMin: Double?
    private var _futureTempMax: Double?
    private var _futureHumidityLevel: Double?
    private var _futureWindSpeed: Double?
    private var _futureSunriseTime: Int?
    private var _futureSunsetTime: Int?
    private var _futurePrecipDescription: String?
    
    var futureDate: String? {
        if let timeInterval: NSTimeInterval = Double(_futureTime!) {
        let dateFromInterval = NSDate(timeIntervalSince1970: timeInterval)
        
        let dayValue = dateFromInterval.weekdayToString()
        let monthValue = dateFromInterval.monthToString()
        let dayNumberValue = dateFromInterval.day()
            
        let dateString = "\(dayValue), \(monthValue) \(dayNumberValue)"
            return dateString
        }
            return nil
    }
    
    var futurePrecipDescription: String? {
        let precipType = _futurePrecipType!
        let precipProb = "\((Int(100 * futurePrecipProb!)))%"
        if precipType != "" {
        let precipFullString = ("\(precipProb) Chance of \(precipType.capitalizedString)")
        return precipFullString
        }
        return ("\(precipProb) Chance of Rain")
    }
    
    var futureTime: Int? {
        return _futureTime
    }
    var futureSummary: String? {
        return _futureSummary
    }
    var futureIcon: String? {
        return _futureIcon
    }
    var futurePrecipType: String? {
        return _futurePrecipType
    }
    var futurePrecipProb: Double? {
        return _futurePrecipProb
    }
    var futureTempMin: Double? {
        return _futureTempMin
    }
    var futureTempMax: Double? {
        return _futureTempMax
    }
    var futureHumidityLevel: Double? {
        return _futureHumidityLevel
    }
    var futureWindSpeed: Double? {
        return _futureWindSpeed
    }
    var futureSunriseTime: Int? {
        return _futureSunriseTime
    }
    var futureSunsetTime: Int? {
        return _futureSunsetTime
    }
    
    
    init(futureTimeInit: Int?, futureSummaryInit: String?, futureIconInit: String?, futurePrecipTypeInit: String?, futurePrecipProbInit: Double?, futureTempMinInit: Double?, futureTempMaxInit: Double?, futureHumidityLevelInit: Double?, futureWindSpeedInit: Double?, futureSunriseTimeInit: Int?, futureSunsetTimeInit: Int? ) {
        

        _futureTime = futureTimeInit
        _futureSummary = futureSummaryInit
        _futureIcon = futureIconInit
        _futurePrecipType = futurePrecipTypeInit
        _futurePrecipProb = futurePrecipProbInit
        _futureTempMin = futureTempMinInit
        _futureTempMax = futureTempMaxInit
        _futureHumidityLevel = futureHumidityLevelInit!
        _futureWindSpeed = futureWindSpeedInit
        _futureSunriseTime = futureSunriseTimeInit
        _futureSunsetTime = futureSunsetTimeInit
    }
    
}





