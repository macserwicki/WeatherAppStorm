//
//  Constants.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 2/29/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import Foundation
import UIKit

//MARK: API Keys

let KEY_WEATHER_API = "150eddf4806ebd2cb122eca6bff9cffd"


//MARK: URL Strings

let URL_WEATHER_BASE = "https://api.forecast.io/"

let URL_WEATHER_API_REQUEST = "\(URL_WEATHER_BASE)forecast/\(KEY_WEATHER_API)"


//Mark: Colors

let COLOR_SHADOW_MEDIUM: CGFloat = 150 / 255.0



//MARK: URL Example

// Example: https://api.forecast.io/forecast/150eddf4806ebd2cb122eca6bff9cffd/37.8267,-122.423
// https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE,TIME



//MARK: Documentation

// API Docs : https://developer.forecast.io/docs/v2