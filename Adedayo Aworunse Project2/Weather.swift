//
//  Weather.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 11/24/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import Foundation
import UIKit
class Weather {
    var Weather_state_name:String = ""
    var Weather_state_abbr:String = ""
    var Applicable_date:String = ""
    var Min_temp:Double = 0
    var Max_temp:Double = 0
    var Wind_speed:Double = 0
    var Wind_direction_compass:String = ""
    var Humidity:Double = 0
    var Predictability:Double = 0
    var ImageState:UIImage
    var Title:String = ""
    var URL:String = "https://www.metaweather.com/"
    var ImagePath:String = ""

    init(){
        Weather_state_name = ""
        Weather_state_abbr = ""
        Applicable_date = ""
        Min_temp = 0
        Max_temp = 0
        Wind_speed = 0
        Wind_direction_compass = ""
        Humidity = 0
        Predictability = 0
        ImageState = UIImage()
        Title = ""
        URL = "https://www.metaweather.com/"
        ImagePath = ""
    }
    
    init(applicable_date:String){
        Applicable_date = applicable_date
        ImageState = UIImage()
    }
    
    init(weather_state_name:String, applicable_date:String){
        Weather_state_name = weather_state_name
        Applicable_date = applicable_date
        ImageState = UIImage()
}
    
    
}
