//
//  CentralViewController.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import UIKit

class CentralViewController: UIViewController {
    
    @IBOutlet weak var menuOutlet: UIBarButtonItem!
    @IBOutlet weak var serverResponseOutlet: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        let image = UIImage(named: "logo-shopmium")
        imageView.image = image
        navigationItem.titleView = imageView
        
        serverResponseOutlet.text = AccountManager.sharedInstance.serverResponse
    }
    
    @IBAction func menuClicked(sender: AnyObject) {
        sideMenuViewController.presentLeftMenuViewController()
    }
    
    
}