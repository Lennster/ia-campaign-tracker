//
//  Imperial_Assault_Campaign_TrackerTests.swift
//  Imperial Assault Campaign TrackerTests
//
//  Created by Martin Leonard on 2016-01-31.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import XCTest
@testable import Imperial_Assault_Campaign_Tracker

class Imperial_Assault_Campaign_TrackerTests: XCTestCase {
    
    // MARK: Campaign model tests
    
    func testCampaignInitialization() {
        // Failure cases
        let noName = Campaign(name: "", notes: nil)
        XCTAssertNil(noName, "Empty name is invalid")
        
        //Success cases
        let campaign1 = Campaign(name:"My First Campaign", notes:nil)
        XCTAssertNotNil(campaign1)
        
        let campaign2 = Campaign(name:"My First Campaign", notes:"Some notes")
        XCTAssertNotNil(campaign2)
        
    }
}
