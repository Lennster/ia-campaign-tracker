//
//  CampaignListTableViewController.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-02-08.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class CampaignListTableViewController: UITableViewController {

    // MARK: Properties
    
    var campaigns = [Campaign]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleCampaigns()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    func loadSampleCampaigns() {
        let campaign1 = Campaign(name: "Sample Campaign1", notes: "this is just a test campaign")!
        let campaign2 = Campaign(name: "Another Campaign", notes: nil)!

        campaigns += [campaign1, campaign2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campaigns.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdenitifer = "CampaignListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdenitifer, forIndexPath: indexPath) as! CampaignListTableViewCell

        let campaign = campaigns[indexPath.row]
        
        cell.campaignName.text = campaign.name
        cell.campaignImageView.image = campaign.photo
        cell.campaignCreatedDate.text = "Created: " + "Jan 2 2016 11:02AM"
        cell.campaignUpdatedDate.text = "Updated: " + "Jan 3 2016 1:20PM"
        cell.imperialPlayer.text = "Imperial Player: " + "Yvonne"
        cell.currentMission.text = "Mission: " + "1 of 11: Aftermath"
        cell.rebelPlayers.text = "Rebel Players: " + "Lenny | Ryan | Isabelle"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: Actions
    
    @IBAction func unwindFromAddCampaign(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddCampaignPopoverViewController, campaign = sourceViewController.campaign {
            // Add a new campaign
            let newIndexPath = NSIndexPath(forRow: campaigns.count, inSection: 0)
            campaigns.append(campaign)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

    
    @IBAction func unwindFromCampaignView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? CampaignViewController, campaign = sourceViewController.campaign {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing campaign
                campaigns[selectedIndexPath.row] = campaign
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCampaignDetail" {
            let campaignViewController = segue.destinationViewController    as! CampaignViewController
            
            // Get the cell that generated this segue
            if let selectedCampaignCell = sender as? CampaignListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedCampaignCell)!
                let selectedCampaign = campaigns[indexPath.row]
                campaignViewController.campaign = selectedCampaign
            }
        }
        else if segue.identifier == "AddCampaignSegueIdentifierForPopOver" {
            // No action required as AddCampaignPopoverViewController handles it
        }
    }

}
