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
    
    @IBOutlet weak var campaignName: UILabel!
    @IBOutlet weak var campaignImageView: UIImageView!
    @IBOutlet weak var campaignCreatedDate: UILabel!
    @IBOutlet weak var campaignUpdatedDate: UILabel!
    @IBOutlet weak var imperialPlayer: UILabel!
    @IBOutlet weak var currentMission: UILabel!
    @IBOutlet weak var rebelPlayers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
