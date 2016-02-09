//
//  CampaignViewController.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-01-31.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var campaignTextField: UITextField!
    @IBOutlet weak var campaignImage: UIImageView!
    @IBOutlet weak var campaignNotesTextView: UITextView!
    @IBOutlet weak var campaignSummaryTableView: UITableView!
    
    // This value is passed via sender in the prepareForSegue call
    var campaign: Campaign?
    
    // MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaignTextField.delegate = self
        campaignSummaryTableView.dataSource = self
        
        if let campaign = campaign {
            navigationItem.title = campaign.name
            campaignTextField.text = campaign.name
            campaignImage.image = campaign.photo
            campaignNotesTextView.text = campaign.notes
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard and complete field editing on return key
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        campaignImage.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return("Campaign Statistics")
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return("Campaign created:")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CampaignSummaryCell")
        
        cell.textLabel?.text = "Some text"
        
        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if Campaign.isValidCampaignName(campaignTextField.text) {
            campaign?.updateCampaign(campaignTextField.text, photo: campaignImage.image, notes: campaignNotesTextView.text)
        }
    }
    
    // MARK: Actions
    
    
    @IBAction func selectCampaignImageFromLibrary(sender: UITapGestureRecognizer) {
        //Hide keyboard as we might be in the campaignTextField
        campaignTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.modalPresentationStyle = .CurrentContext
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }    
}

