//
//  AddCampaignPopoverViewController.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-02-08.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class AddCampaignPopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var newCampaignNameTextField: UITextField!
    @IBOutlet weak var newCampaignNotesTextView: UITextView!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // This value is constructed as part of adding a new campaign.
    var campaign: Campaign?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newCampaignNameTextField.delegate = self
        
        //Save button should be disabled when popover first opens
        saveButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if newCampaignNameTextField === textField {
            // Disable the Save button while editing.
            saveButton.enabled = false
        }
    }

    func checkValidCampaignName() {
        // Disable the Save button if the text field is empty.
        // let text = newCampaignNameTextField.text ?? ""
        saveButton.enabled = Campaign.isValidCampaignName(newCampaignNameTextField.text)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard and complete field editing on return key
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidCampaignName()
    }
    
    
    // MARK: Popover delegate actions
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        //do some stuff
    }
    

    // MARK: - Navigation

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let campaignName = newCampaignNameTextField.text ?? ""
            let campaignNotes = newCampaignNotesTextView.text ?? ""
            
            campaign = Campaign(name: campaignName, notes: campaignNotes)
        }
        
        //segue for the popover add campaign window
        if segue.identifier == "AddCampaignSegueIdentifierForPopOver" {
            print("AddCampaign.prepareForSegue")
            let controller = segue.destinationViewController
            controller.popoverPresentationController!.delegate = self
        }
    }

}
