//
//  ViewController.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 2/28/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let coordinates = "37.8267,-122.423"
    var _latValue = "37.8267"
    var _longValue = "122.423"
    
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var precipLbl: UILabel!
    
    @IBOutlet weak var humidLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    var locationManager: CLLocationManager!
    
    var weatherData = [CurrentWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init Location Manager
            locationManager = CLLocationManager()
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUserLocationWeather (longitude: String!, latitude: String!, time: NSString!) {
    
    let location = "\(latitude),\(longitude)/"
        
    print("\(URL_WEATHER_API_REQUEST)/\(location)\(time)")
        
    Alamofire.request(.GET, "\(URL_WEATHER_API_REQUEST)/\(location)\(time)").responseData { response in
    
    let result = response.result.value
    
    if let responseData = result {
    
    do {
    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
        
    print(json)
    
    let jsonDict = json as! Dictionary<String, AnyObject>
    
    let weather = CurrentWeather.init(dict: jsonDict)
    
    //Add error handling
        
    self.tempLbl.text = "\(weather.temperature!.description)°"
    // Unicode for degree ° - U+00B0
        
    let precip = (weather.precipitationProbability! * Double(100.00)).description
        
    self.precipLbl.text = "\(precip)%"
        
    let humid = (weather.humidityLevel! * Double(100.00)).description
        
    self.humidLbl.text = "\(humid)%"
        
    self.descLbl.text = weather.summaryOfWeather
        
        
        
        print("We Got To Forecasted Weather\(weather.forecastedWeather?.count)")
        
        
        //add error handling
        for var x = 0; x < weather.forecastedWeather?.count; x++ {
        print(weather.forecastedWeather![x].futureSummary!)
        print(weather.forecastedWeather![x].futureHumidityLevel!)
        print(weather.forecastedWeather![x].futureTempMax!)

        print("we got to the second future loop")
        }
        
            } catch {
            print("Json Data Request Didn't Work")
            }
        
                }
            }
    }
    
    
    func makeStringLength (stringLength: Int, var stringName: String) -> String {
        //Index may be out of range if Long or Lat is less than 8 Characters.
        stringName+="000000000"
       return stringName.substringWithRange(Range<String.Index>(start: stringName.startIndex.advancedBy(0), end: stringName.endIndex.advancedBy(-stringName.characters.count + stringLength )))
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("Location Updated")
        
        let userLocation: CLLocation = locations[0]
        
        var latValue: String = userLocation.coordinate.latitude.description
        var longValue: String = userLocation.coordinate.longitude.description
        
        var newLatValue: String {
            if latValue.containsString("-") {
              return makeStringLength(8, stringName: latValue)
            } else {
              return makeStringLength(7, stringName: latValue)
            }
        }
        
        var newLongValue: String {
            if longValue.containsString("-") {
                return makeStringLength(8, stringName: longValue)
            } else {
                return makeStringLength(7, stringName: longValue)
            }
        }
      
        _latValue = newLatValue
        _longValue = newLongValue

        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        print(_latValue)
        print(_longValue)
        updateUserLocationWeather(_longValue, latitude: _latValue, time: "")
        locationManager.stopUpdatingLocation()
    }
    
}

