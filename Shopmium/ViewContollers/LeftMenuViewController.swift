//
//  LeftMenuViewController.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var emailOutlet: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        emailOutlet.text = AccountManager.sharedInstance.currentUser?.email
    }
    
    @IBAction func logout(sender: AnyObject) {
        self.performSegueWithIdentifier("ExitTheMatrixSegue", sender: nil)
    }
}