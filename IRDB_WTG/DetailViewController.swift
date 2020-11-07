//
//  ViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/5/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!

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
        
        if let entry = detailItem {
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = entry.name
            }
        }
    }
}

