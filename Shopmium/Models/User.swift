//
//  User.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import Foundation
import JSONJoy

//The object that will represent our response. More Info in the JSON Parsing section below.
struct User : JSONJoy {
    var id: Int?
    var email: String?
    var lastName: String?
    var firstName: String?
    var referralCode: String?
    var account: Int?
    var token: String?
    init() {
        
    }
    init(_ decoder: JSONDecoder) {
        id = decoder["id"].integer
        email = decoder["email"].string
        account = decoder["account"].integer
        lastName = decoder["last_name"].string
        firstName = decoder["first_name"].string
        referralCode = decoder["referral_code"].string
        token = decoder["token"].string
    }
}