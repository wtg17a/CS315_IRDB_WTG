//
//  BugFablesViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/11/20.
//

import UIKit

class BugFablesTableViewController: UITableViewController {

    var mediaModel: CustomDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = BugFablesDataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "IRDb"
        
        // 1
        let nav = self.navigationController?.navigationBar
          
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
          
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit
              
        // 4
        let image = UIImage(named: "irdblogo")
        imageView.image = image
              
        // 5
        navigationItem.titleView = imageView
        
        // Call dataController and wait
        dataController.getJSONData(completion: {dataModel in
            self.mediaModel = dataModel
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return mediaModel?.categories.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel?.categories[section].entries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.categories[section].bossType
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        
        
        // Configure the cell...
        cell.textLabel?.text = mediaModel?.categories[indexPath.section].entries[indexPath.row].name
        
        cell.detailTextLabel?.text = "Chapter \(mediaModel?.categories[indexPath.section].entries[indexPath.row].chapter ?? 0)"

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMediaDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = mediaModel!.categories[indexPath.section].entries[indexPath.row]
                let controller = segue.destination as! BugFablesDetailViewController
                controller.detailItem = selectedObject
            }
        }
    }
    

}

