//
//  Weather.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 11/24/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import Foundation
class Weather {
    var Key:String = ""
    var LocalizedName:String = ""
    
    init(){
        Key = ""
        LocalizedName = ""
    }
    
    init(localizedname:String){
        LocalizedName = localizedname
    }
    
    init(key:String, localizedname:String){
        Key = key
        LocalizedName = localizedname
}
}
