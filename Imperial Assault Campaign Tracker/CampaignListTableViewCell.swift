//
//  CampaignListTableViewCell.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-02-07.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class CampaignListTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var CampaignNameLabel: UILabel!
    @IBOutlet weak var CampaignImageView: UIImageView!
    @IBOutlet weak var CampaignCreatedDateLabel: UILabel!
    @IBOutlet weak var CampaignUpdatedDateLabel: UILabel!
    @IBOutlet weak var CampaignImperialPlayerLabel: UILabel!
    @IBOutlet weak var CampaignCurrentMissionLabel: UILabel!
    @IBOutlet weak var CampaignRebelPlayersLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
