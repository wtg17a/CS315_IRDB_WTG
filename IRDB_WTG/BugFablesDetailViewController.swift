//
//  BugFablesDetailViewController.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/11/20.
//

import UIKit

class BugFablesDetailViewController: UIViewController {

    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!

    var detailItem: Boss? {
        didSet {
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
        title = detailItem?.name
        
        configureView()
    }

    func configureView() {
        
        if let entry = detailItem {
            if let thisMediaImage = mediaImage {
                let url = URL(string: entry.bossImageURL)
                let data:NSData? = NSData(contentsOf: url!)
                thisMediaImage.image = UIImage(data: data! as Data)
            }
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = entry.name
            }
            if let thisYearLabel = yearLabel {
                thisYearLabel.text = "Chapter \(entry.chapter)"
            }
            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = "HP: \(entry.hp)"
            }
            if let thisEpisodeLabel = episodeLabel {
                thisEpisodeLabel.text = "Def: \(entry.defense)"
            }
            if let thisStudioLabel = studioLabel {
                thisStudioLabel.text = "Base XP: \(entry.baseXP)"
            }
            
            // Bottom view
            
            if let thisDescriptionLabel = descriptionLabel {
                thisDescriptionLabel.text = entry.bestiary
            }
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = "Vi's description: \(entry.tattleVi)\n\nKabbu's description: \(entry.tattleKabbu)\n\nLeif's description: \(entry.tattleLeif)\n\nReward: \(entry.reward)\n\nHard mode reward: \(entry.hardModeReward ?? "None")"
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList" {
            let controller = segue.destination as! BugFablesResistancesTableViewController
            controller.resistanceArray = detailItem?.resistances
        }
    }

}
