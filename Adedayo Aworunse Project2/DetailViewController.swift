//
//  DetailViewController.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 10/31/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import UIKit
import AVFoundation
class DetailViewController: UIViewController {
var targetSound: AVAudioPlayer!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var weat: UIImageView!
    
    @IBAction func btnAction(_ sender: Any) {
        targetSound.play()
    }
    @IBAction func webButton(_ sender: Any) {
        let text = detailItem?.URL
        let app = UIApplication.shared
        let urlAddress = text
        let urlw = URL(string:urlAddress!)
        app.openURL(urlw!)
        
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.Weather_state_name
        }
    }
        targetSound = try?
            AVAudioPlayer(contentsOf:  URL(fileURLWithPath:Bundle.main.path(forResource: "Wind", ofType: "wav")!))
    }
    
    func setIcon(){
        let text = detailItem?.Weather_state_abbr
        switch text{
        case "s"?:
            weat.image = UIImage(named: "s.png")
        case "c"?:
            weat.image = UIImage(named: "c.png")
        case "h"?:
            weat.image = UIImage(named: "h.png")
        case "hc"?:
            weat.image = UIImage(named: "hc.png")
        case "hr"?:
            weat.image = UIImage(named: "hr.png")
        case "lc"?:
            weat.image = UIImage(named: "lc.png")
        case "lr"?:
            weat.image = UIImage(named: "lr.png")
        case "sl"?:
            weat.image = UIImage(named: "sl.png")
        case "sn"?:
            weat.image = UIImage(named: "sn.png")
        case "t"?:
            weat.image = UIImage(named: "t.png")
        default:
            weat.image = UIImage(named: "s.png")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        setIcon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Weather? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubView1" {
            let destinationController = segue.destination as! SubViewController
            destinationController.subViewVariable = detailItem
        }
    }

}

