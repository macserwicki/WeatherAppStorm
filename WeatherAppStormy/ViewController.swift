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
    
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var precipLbl: UILabel!
    
    @IBOutlet weak var humidLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    
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
    
        //Add error handling
        
    self.tempLbl.text = "\(weather.temperature!.description)°"
    
        
    let precip = (weather.precipitationProbability! * Double(100.00)).description
        
    self.precipLbl.text = "\(precip)%"
        
    let humid = (weather.humidityLevel! * Double(100.00)).description
        
    self.humidLbl.text = "\(humid)%"
        
    self.descLbl.text = weather.summaryOfWeather
    
            } catch {
            print("Json Data Request Didn't Work")
            }
        
                }
            }
    }
    
    
    
    
}

