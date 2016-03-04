//
//  Weather.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 3/2/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import Foundation


class FutureWeather {

    
    //testing
    private var _futureWeatherDescription: String?
    
    var futureWeatherDescription: String? {
        return _futureWeatherDescription
    }
    
    init(descriptionString: String) {
        _futureWeatherDescription = futureWeatherDescription
    }
    
}


/*
}


if let futureTime = day["time"] as? Double {
    print(futureTime)
}

if let futureSummary = day["summary"] as? String {
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

*/


