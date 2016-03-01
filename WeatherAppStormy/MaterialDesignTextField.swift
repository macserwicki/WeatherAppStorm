//
//  MaterialDesignTextField.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 3/1/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import UIKit

class MaterialDesignUITextField: UITextField {
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor(red: COLOR_SHADOW_MEDIUM, green: COLOR_SHADOW_MEDIUM, blue: COLOR_SHADOW_MEDIUM, alpha: 0.25).CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        
    }
    

    
}