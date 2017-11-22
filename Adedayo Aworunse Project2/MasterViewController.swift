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
    var SwiftTerms = [SwiftTerm]()

    func PopulateSwiftTerms() {
        
        let urlString = "https://api.myjson.com/bins/fzr7r"
        let jsURL:URL = URL(string: urlString)!
        let jsonUrlData = try? Data (contentsOf: jsURL)
        print(jsonUrlData ?? "ERROR: No data To Print. JSONURLData is Nil")
        if(jsonUrlData != nil){
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with:
                jsonUrlData!, options: JSONSerialization.ReadingOptions.mutableContainers))
                as! NSDictionary
            print(dictionary)
            
            let swiftTermDetails = dictionary["SwiftTerms"] as! [[String:AnyObject]]
            
            for index in 0...swiftTermDetails.count - 1
            {
                let single = swiftTermDetails[index]
                let st = SwiftTerm()
                st.ID = single["TermID"] as! Int
                st.Name = single["TermName"] as! String
                st.Description = single["TermDescription"] as! String
                SwiftTerms.append(st)
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        PopulateSwiftTerms()
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
                let object = SwiftTerms[indexPath.row]
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
        return SwiftTerms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = SwiftTerms[indexPath.row]
        cell.textLabel!.text = object.Name
        cell.detailTextLabel!.text = object.Description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

