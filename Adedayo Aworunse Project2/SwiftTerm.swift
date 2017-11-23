//
//  SwiftTerm.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 11/20/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//github test
import Foundation
class SwiftTerm {
    var ID:Int = 0
    var Name:String = ""
    var Description:String = ""
    
    init(){
        ID = 0
        Name = ""
        Description = ""
    }
    
    init(name:String, description:String){
        Name = name
        Description = description
    }
    
    init(id:Int, name:String, description:String){
        ID = id
        Name = name
        Description = description
    }
}
