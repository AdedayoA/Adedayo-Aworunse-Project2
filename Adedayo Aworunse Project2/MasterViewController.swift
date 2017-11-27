//
//  MasterViewController.swift
//  Adedayo Aworunse Project2
//
//  Created by Adedayo on 10/31/17.
//  Copyright © 2017 Adedayo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var Weathers = [Weather]()

    func PopulateWeathers() {
        
        let urlString = "https://api.myjson.com/bins/xxhcv"
        let jsURL:URL = URL(string: urlString)!
        let jsonUrlData = try? Data (contentsOf: jsURL)
        print(jsonUrlData ?? "ERROR: No Data To Print. JSONURLData is Nil")
        
        if(jsonUrlData != nil){
            let dictionary:NSDictionary = //Dictionary<String,AnyObject>
                (try! JSONSerialization.jsonObject(with: jsonUrlData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary //Dictionary<String,AnyObject>
            print(dictionary)
            
            var weatherDetails = dictionary["Weathers"] as! [[String:AnyObject]]
            
            for index in 0...weatherDetails.count - 1
            {
                let single = weatherDetails[index]
                let st = Weather()
                st.Key = single["Key"] as! String
                st.LocalizedName = single["LocalizedName"] as! String
                //st.PrimaryPostalCode = single["PrimaryPostalCode"] as! String
                Weathers.append(st)
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
        cell.textLabel!.text = object.LocalizedName
        cell.detailTextLabel!.text = object.Key
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

