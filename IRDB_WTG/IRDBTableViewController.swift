//
//  IRDBTableViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/5/20.
//

import UIKit

class IRDBTableViewController: UITableViewController {

    //Temporary data model
    var outerArray = ["Section 1", "Section 2"]
    var innerArray1 = ["Item 1", "Item 2", "Item 3"]
    var innerArray2 = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
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
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return outerArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            return innerArray1.count
        }
        else if(section == 1) {
            return innerArray2.count
        }
        else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return outerArray[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        var arrayForThisCell = [Any]()
        
        if(indexPath.section == 0) {
            arrayForThisCell = innerArray1
        } else if(indexPath.section == 1) {
            arrayForThisCell = innerArray2
        }
        
        // Configure the cell...
        cell.textLabel?.text = arrayForThisCell[indexPath.row] as? String

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
