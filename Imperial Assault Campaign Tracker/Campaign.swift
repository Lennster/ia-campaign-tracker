//
//  Campaign.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-02-08.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class Campaign {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var notes: String?
    var createdDate: NSDate
    var updatedDate:NSDate
    var rebelXP: Int
    var rebelCredits: Int
    var imperialXP: Int
    var imperialInfluence: Int
    
    // MARK: Initialization
    
    init?(name: String, notes:String?) {
        self.name = name
        self.notes = notes
        self.createdDate = NSDate()
        self.updatedDate = self.createdDate
        self.rebelXP = 0
        self.rebelCredits = 0
        self.imperialXP = 0
        self.imperialInfluence = 0

        // Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
    }
}
