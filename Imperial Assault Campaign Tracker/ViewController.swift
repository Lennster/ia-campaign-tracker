//
//  ViewController.swift
//  Imperial Assault Campaign Tracker
//
//  Created by Martin Leonard on 2016-01-31.
//  Copyright © 2016 Martin Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var campaignName: UILabel!
    @IBOutlet weak var campaignTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaignTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        print("Entered value \(textField.text)")
        campaignName.text = textField.text
    }
}

