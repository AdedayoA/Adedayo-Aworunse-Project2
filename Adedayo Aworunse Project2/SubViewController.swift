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
    @IBOutlet weak var minlbl: UILabel!
    @IBOutlet weak var maxlbl: UILabel!
    @IBOutlet weak var wslbl: UILabel!
    @IBOutlet weak var aplbl: UILabel!
    @IBOutlet weak var humlbl: UILabel!
    @IBOutlet weak var predlbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var imgState: UIImageView!
    
    func setMinimum(){
        if let detail = subViewVariable{
            if let label = minlbl {
                label.text = String(format: "The minimum temp will %.0f", detail.Min_temp) as String + "°F"
            }
        }
    }
    
    func setMaximum(){
        if let detail = subViewVariable{
            if let label = maxlbl {
                label.text = String(format: "The maximum temp will %.0f", detail.Max_temp) as String + "°F"
            }
        }
    }
    
    func setWindSpeed(){
        if let detail = subViewVariable{
            if let label = wslbl {
                label.text = String(format: "The windspeed will be %.02f", detail.Wind_speed) as String + "mph"
            }
        }
    }
    
    func setWindDirection(){
        if let detail = subViewVariable{
            if let label = aplbl {
                label.text = "Wind Direction " + detail.Wind_direction_compass
            }
        }
    }
    
    func setDate(){
        
        if let detail = subViewVariable{
            if let label = datelbl {
                label.text = detail.Applicable_date
            }
        }
    }
    func setHumidity(){
        if let detail = subViewVariable{
            if let label = humlbl {
                label.text = String(format: "The humidity will be %.0f", detail.Humidity) as String + "%"
            }
        }
    }

    
    func setPredictability(){
        if let detail = subViewVariable{
            if let label = predlbl {
                label.text = String(format: "The prediction is %.0f", detail.Predictability) as String + "% accurate"
            }
        }
    }
    
    func setIcon(){
        let text = subViewVariable?.Weather_state_abbr
        switch text{
        case "s"?:
            imgState.image = UIImage(named: "s.png")
        case "c"?:
            imgState.image = UIImage(named: "c.png")
        case "h"?:
            imgState.image = UIImage(named: "h.png")
        case "hc"?:
            imgState.image = UIImage(named: "hc.png")
        case "hr"?:
            imgState.image = UIImage(named: "hr.png")
        case "lc"?:
            imgState.image = UIImage(named: "lc.png")
        case "lr"?:
            imgState.image = UIImage(named: "lr.png")
        case "sl"?:
            imgState.image = UIImage(named: "sl.png")
        case "sn"?:
            imgState.image = UIImage(named: "sn.png")
        case "t"?:
            imgState.image = UIImage(named: "t.png")
        default:
            imgState.image = UIImage(named: "s.png")
        }
        
    }
        
    func setText() {
        
        UIView.animate(withDuration: 3.0,
                       animations: {
                        self.minlbl.alpha = 1.0
                        self.maxlbl.alpha = 1.0
                        self.wslbl.alpha = 1.0
        })
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setText()
    }
    
    override func motionBegan(_ motion: UIEventSubtype,
                              with event: UIEvent?) {
        
        minlbl.alpha = 0.0
        maxlbl.alpha =  0.0
        wslbl.alpha = 0.0
        
    }
    

      override func viewDidLoad(){
        minlbl.center.x = self.view.frame.width + 30
        maxlbl.center.x = self.view.frame.width + 30
        wslbl.center.x = self.view.frame.width + 30
        aplbl.center.x = self.view.frame.width + 30
        humlbl.center.x = self.view.frame.width + 30
        predlbl.center.x = self.view.frame.width + 30
        imgState.center.x = self.view.frame.width + 30
        
        if subViewVariable != nil{
            lblSubViewLabel.text = subViewVariable?.Weather_state_name
        }
        setText()
        setMinimum()
        setMaximum()
        setWindSpeed()
        setWindDirection()
        setHumidity()
        setPredictability()
        setDate()
        setIcon()
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {
        
            self.minlbl.center.x = self.view.frame.width / 2
           
            }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {
            
            self.maxlbl.center.x = self.view.frame.width / 2

        }, completion: nil)
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {
            
            self.wslbl.center.x = self.view.frame.width / 2
            
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {

            self.aplbl.center.x = self.view.frame.width / 2
            
        }, completion: nil)
        UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {
        
            self.humlbl.center.x = self.view.frame.width / 2
            
        }, completion: nil)
        UIView.animate(withDuration: 6.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {

            self.predlbl.center.x = self.view.frame.width / 2
            
        }, completion: nil)

        UIView.animate(withDuration: 7.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: {
            
            self.imgState.center.x = self.view.frame.width / 2
            
        }, completion: nil)


    }
    var subViewVariable: Weather? = nil
}
