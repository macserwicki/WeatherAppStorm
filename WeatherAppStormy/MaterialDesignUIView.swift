//
//  MaterialDesignUIView.swift
//  WeatherAppStormy
//
//  Created by Maciej Serwicki on 3/1/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

import UIKit

class MaterialDesignUIView: UIView {
    
    
    func materialDesign (viewToChange: UIView) {
        viewToChange.layer.cornerRadius = 2.0
        viewToChange.layer.shadowColor = UIColor.blackColor().CGColor
        viewToChange.layer.shadowOpacity = 0.4
        viewToChange.layer.shadowRadius = 5.0
        viewToChange.layer.shadowOffset = CGSizeMake(0.0, 0.0)
    }
    
    override func awakeFromNib() {
        
        materialDesign(self)
        
    }

}