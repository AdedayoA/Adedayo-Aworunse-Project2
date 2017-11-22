//
//  SubViewController.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 11/20/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import Foundation
import UIKit
class SubViewController : UIViewController {
    @IBOutlet weak var lblSubViewLabel: UILabel!
    
    override func viewDidLoad(){
        if subViewVariable != nil{
            lblSubViewLabel.text = subViewVariable?.Description
        }
    }
    var subViewVariable: SwiftTerm? = nil
}
