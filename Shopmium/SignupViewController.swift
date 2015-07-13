//
//  SignupViewController.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/12/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import UIKit
import ReactiveCocoa
import SwiftSpinner


class SignupViewController: UIViewController {
    
    @IBOutlet weak var mailOutlet: UITextField!
    @IBOutlet weak var registerOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mailOutlet.rac_textSignal().subscribeNext {
            [weak self] (value) -> () in
            if let text = value as? String {
                self?.registerOutlet.enabled = text.isEmail()
                self?.registerOutlet.alpha = text.isEmail() ? 1.0 : 0.5
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        let image = UIImage(named: "logo-shopmium")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerEmail(sender: AnyObject) {
        
        SwiftSpinner.show(NSLocalizedString("signing_up", comment:""))
        
        var scheduler = QueueScheduler.mainQueueScheduler
        AccountManager.sharedInstance.createUser(mailOutlet.text)
            |> observeOn(QueueScheduler.mainQueueScheduler)
            |> start(
                next: {
                    response in
                    SwiftSpinner.hide()
                    log("in viewController response \(response)")
                    self.performSegueWithIdentifier("EnterTheMatrixSegue", sender: nil)
                },
                error: {
                    SwiftSpinner.hide()
                    let alertView = UIAlertView(title:"Error", message:"\($0.domain)" , delegate: nil, cancelButtonTitle: "Ok")
                    alertView.alertViewStyle = .Default
                    alertView.show()
                }
        )
    }
    
    
}