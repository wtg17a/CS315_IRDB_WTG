//
//  CastTableViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/8/20.
//

import UIKit

class CastTableViewController: UITableViewController {

    var castListArray: [Cast]?
    
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
        return castListArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = castListArray?[indexPath.row].actorName
        
        cell.detailTextLabel?.text = castListArray?[indexPath.row].role

        return cell
    }

}
