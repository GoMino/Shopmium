//
//  ViewController.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/12/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(segue: UIStoryboardSegue) {
        //do stuff
    }
}

