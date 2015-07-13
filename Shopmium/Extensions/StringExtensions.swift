//
//  StringExtensions.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)$"
        let regex = NSRegularExpression(pattern: emailRegEx, options: .CaseInsensitive, error: nil)
        return regex?.firstMatchInString(self, options: nil, range: NSMakeRange(0, count(self))) != nil
    }
}