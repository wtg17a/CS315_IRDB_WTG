//
//  BugFablesDataController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/11/20.
//

import UIKit

class BugFablesDataController: NSObject {

    let JSONURL = "https://api.jsonbin.io/b/5fac62c0ea9b612e1c668486"
    
    var dataModel: CustomDataModel?
    
    func getJSONData(completion: @escaping(_ dataModel: CustomDataModel) -> ()) {
        
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
            (data, response, error) in
            
            guard let thisData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(CustomDataModel.self, from: thisData)
                
                self.dataModel = thisMediaData
                print(thisMediaData)
                
                // Go back to main thread
                DispatchQueue.main.async {
                    completion(self.dataModel!)
                }
            } catch let err {
                print("ERROR WAS: ", err)
            }
        }
        dataTask.resume()
    }
}
