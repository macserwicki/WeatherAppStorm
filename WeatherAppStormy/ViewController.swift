//
//  ViewController.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 2/28/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let coordinates = "37.8267,-122.423"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        requestWeatherData(coordinates, time: "")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestWeatherData (location: String!, time: NSString!) {
    
    print("\(URL_WEATHER_API_REQUEST)/\(location)\(time))")
        
    Alamofire.request(.GET, "\(URL_WEATHER_API_REQUEST)/\(location)\(time)").responseData { response in
    
    
    // print(response.request)
    // print(response.response)
    // print(response.result.value)
    
    let result = response.result.value
    
    if let responseData = result {
    
    do {
    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
        
    print(json)
    
    let jsonDict = json as! Dictionary<String, AnyObject>
    
    let weather = CurrentWeather.init(dict: jsonDict)
    
    print(weather.temperature)
    print(weather.windSpeed)
    print(weather.precipitationProbability)
    print(weather.icon)
    print(weather.humidityLevel)
    print(weather.summaryOfWeather)
    
            } catch {
            print("Json Data Request Didn't Work")
            }
        
                }
            }
    }
    
    
    
    
}

