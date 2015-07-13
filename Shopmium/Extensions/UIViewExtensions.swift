//
//  UIViewExtensions.swift
//  innerly
//
//  Created by Gregory Potdevin on 07/11/2014.
//  Copyright (c) 2014 labgency. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed,bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}