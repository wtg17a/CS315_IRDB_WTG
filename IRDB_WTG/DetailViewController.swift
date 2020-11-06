//
//  ViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/5/20.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: Entry? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func configureView() {
        
    }
}

