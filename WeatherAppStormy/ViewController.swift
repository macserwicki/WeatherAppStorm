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

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {

    let coordinates = "37.8267,-122.423"
    var _latValue = "37.8267"
    var _longValue = "122.423"
    var _weather: CurrentWeather?
    
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var highLbl: UILabel!
    
    @IBOutlet weak var lowLbl: UILabel!
    
    @IBOutlet weak var precipLbl: UILabel!
    
    @IBOutlet weak var humidLbl: UILabel!
    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!


    
    var locationManager: CLLocationManager!
    
    var futureWeather = [FutureWeather]()
    
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
        
    self.tempLbl.text = "\(Int(weather.temperature!))°"
        
    let humid = Int(100 * weather.humidityLevel!)
        
    self.humidLbl.text = "\(humid)% Humidity"
        
    self.futureWeather = weather.forecastedWeather!
        
        self.highLbl.text = "\(Int(self.futureWeather[0].futureTempMax!))°"
        
        self.lowLbl.text = "\(Int(self.futureWeather[0].futureTempMin!))°"
        
        self.dayLbl.text = self.futureWeather[0].futureDate
        
        self.descLbl.text = self.futureWeather[0].futureSummary
        
        self.precipLbl.text = self.futureWeather[0].futurePrecipDescription

        self.futureWeather.removeFirst()

        self.tableView.reloadData()

        
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
    
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print(_latValue)
        print(_longValue)
        updateUserLocationWeather(_longValue, latitude: _latValue, time: "")
        locationManager.stopUpdatingLocation()
    }
 
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("TableView Count - \(futureWeather.count)")
        return futureWeather.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("FutureWeatherCell") as? FutureWeatherCell {
        
  

            
            //highLbl - from 0 index
            //lowLbl - from 0 index
            //dayLbl - from 0 index

        let weatherForCell = futureWeather[indexPath.row]
             
        
        print("future humid lbl")
        print( cell.futureHumidityLbl.text)
        print(String(weatherForCell.futureTempMax!))
        
            
            
        cell.futureSummaryLbl.text = (weatherForCell.futureSummary!)
            
        cell.futureTempMaxLbl.text = "\(Int(weatherForCell.futureTempMax!).description)°"
        
        cell.futureTempMinLbl.text = " \(Int(weatherForCell.futureTempMin!).description)°"
            
        cell.futureTimeLbl.text = weatherForCell.futureDate!
        
        let humidityString = Int(100 * weatherForCell.futureHumidityLevel!)
        cell.futureHumidityLbl.text = "\(humidityString)% Humidity"
            
        cell.futurePrecipProbLbl.text = weatherForCell.futurePrecipDescription
            
            
        
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 165
        
    }
    
    
}

