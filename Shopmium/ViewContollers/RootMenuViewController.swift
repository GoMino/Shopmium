//
//  RootViewController.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import UIKit
import RESideMenu

class RootMenuViewController: RESideMenu {
    
    override func awakeFromNib() {
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController") as! UIViewController
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("leftMenuViewController")as! UIViewController
        scaleContentView = false
        scaleMenuView = false
        contentViewShadowEnabled = true
        contentViewInPortraitOffsetCenterX = UIDevice.currentDevice().userInterfaceIdiom == .Phone ? 100: 290;
    }
}