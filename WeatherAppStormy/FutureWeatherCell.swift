//
//  FutureWeatherCellTableViewCell.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 3/5/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import UIKit

class FutureWeatherCell: UITableViewCell {

    
    
    @IBOutlet weak var futureTimeLbl: UILabel!
    @IBOutlet weak var futureSummaryLbl: UILabel!
    @IBOutlet weak var futureIconView: UIImageView!
    @IBOutlet weak var futurePrecipTypeLbl: UILabel!
    @IBOutlet weak var futurePrecipProbLbl: UILabel!
    @IBOutlet weak var futureTempMinLbl: UILabel!
    @IBOutlet weak var futureTempMaxLbl: UILabel!
    @IBOutlet weak var futureHumidityLbl: UILabel!
    @IBOutlet weak var futureWindSpeedLbl: UILabel!
    @IBOutlet weak var futureSunriseTimeLbl: UILabel!
    @IBOutlet weak var futureSunsetTimeLbl: UILabel!

    
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor(red: COLOR_SHADOW_MEDIUM, green: COLOR_SHADOW_MEDIUM, blue: COLOR_SHADOW_MEDIUM, alpha: 0.25).CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
