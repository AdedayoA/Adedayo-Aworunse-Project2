//
//  MasterViewController.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 10/31/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import UIKit
import JavaScriptCore

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var Weathers = [Weather]()

    func PopulateWeathers() {
        // 2354490 - Alaska
        // 615702 - Paris, France
        // 2514815 - Fairfax
        let urlString = "https://www.metaweather.com/api/location/2354490"
        
        let jsURL:URL = URL(string: urlString)!
        
        let jsonUrlData = try? Data (contentsOf: jsURL)
        
        print(jsonUrlData ?? "ERROR: No data to print. JSONURLData Is Nil")
        if(jsonUrlData != nil){
            
        let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with:
         jsonUrlData!, options: JSONSerialization.ReadingOptions.mutableContainers))
         as! NSDictionary
         print(dictionary)
         
           let weatherDetails = dictionary["consolidated_weather"] as! [[String:AnyObject]]

        
         for index in 0...weatherDetails.count - 1
         {
         let single = weatherDetails[index]
         let weather = Weather()
         weather.Weather_state_name = single["weather_state_name"] as! String
         weather.Weather_state_abbr = single["weather_state_abbr"] as! String
         weather.Applicable_date = single["applicable_date"] as! String
         weather.Min_temp = (single["min_temp"] as! Double) * 1.8 + 32
         weather.Max_temp = (single["max_temp"] as! Double) * 1.8 + 32
         weather.Wind_speed = single["wind_speed"] as! Double
         weather.Wind_direction_compass = single["wind_direction_compass"] as! String
         weather.Humidity = single["humidity"] as! Double
         weather.Predictability = single["predictability"] as! Double
         Weathers.append(weather)
         }
         
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        PopulateWeathers()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = Weathers[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Weathers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = Weathers[indexPath.row]
        cell.textLabel!.text = object.Weather_state_name
        cell.detailTextLabel!.text = object.Applicable_date
        let text = object.Weather_state_abbr
        switch text{
        case "s":
            object.ImagePath = "s"
        case "c":
            object.ImagePath = "c"
        case "h":
            object.ImagePath = "h"
        case "hc":
            object.ImagePath = "hc"
        case "hr":
            object.ImagePath = "hr"
        case "lc":
            object.ImagePath = "lc"
        case "lr":
            object.ImagePath = "lr"
        case "sl":
            object.ImagePath = "sl"
        case "sn":
            object.ImagePath = "sn"
        case "t":
            object.ImagePath = "t"
        default:
            object.ImagePath = "s"
        }
        let imgURL = URL(string:"https://www.metaweather.com/static/img/weather/png/\(object.ImagePath).png")!
        let dataBytes = try? Data(contentsOf: imgURL)
        let img = UIImage(data: dataBytes!)
        
        cell.imageView?.image = img
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

