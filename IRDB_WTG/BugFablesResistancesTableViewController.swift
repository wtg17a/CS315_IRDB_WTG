//
//  BugFablesResistancesTableViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/11/20.
//

import UIKit

class BugFablesResistancesTableViewController: UITableViewController {

    var resistanceArray: [Resistance]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resistanceArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = resistanceArray?[indexPath.row].resistanceName
        
        if let thisResistanceValue = resistanceArray?[indexPath.row].resistanceValue {
            cell.detailTextLabel?.text = "\(thisResistanceValue)"
        } else if let thisResistanceBool = resistanceArray?[indexPath.row].resistanceBool {
            if(thisResistanceBool) {
                cell.detailTextLabel?.text = "Yes"
            } else {
                cell.detailTextLabel?.text = "No"
            }
        } else {
            cell.detailTextLabel?.text = "Immune"
        }

        return cell
    }
}
