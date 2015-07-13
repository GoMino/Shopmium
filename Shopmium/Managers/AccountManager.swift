//
//  AccountManagers.swift
//  Shopmium
//
//  Created by Amine Bezzarga on 7/13/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

import Foundation
import SwiftHTTP
import JSONJoy
import ReactiveCocoa

class AccountManager {
    static let sharedInstance = AccountManager()
    var currentUser: User?
    var serverResponse: String?
    
    init(){
    }
    
    func createUser(email: String) -> SignalProducer<User, NSError> {
        
        let signal: SignalProducer<User, NSError> = SignalProducer { observer, disposable in
            
            var request = HTTPTask()
            request.requestSerializer = JSONRequestSerializer()
            request.requestSerializer.headers["Content-Type"] = "application/json"
            request.responseSerializer = JSONResponseSerializer()
            var local = NSLocale.preferredLanguages()[0] as! String
            let params = "{\"user\":{\"email\":\"\(email)\"},\"referral_code\":\"\",\"timezone_offset\":-120,\"ti_id\":\"A5F9DCD3-E1D1-4424-BC7A-99121D5073E6\",\"install_key\":\"\",\"app_key\":\"U2FsdGVkX19zc3Nzc3Nzc9opL1kESmS2aGqN8T4To8U=\\n\",\"installation_source\":1,\"install_keys\":[],\"logout\":1,\"device\":\"{}\",\"role\":1,\"language\":\"\(local)\"}"
            var data = params.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)
            var localError: NSError?
            var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &localError)
            
            if let dict = json as? [String: AnyObject] {
                
                request.POST("https://app-staging.shopmium.com/mobileapp/v39/user", parameters: dict, completionHandler: {(response: HTTPResponse) in
                    if let err = response.error {
                        log("error: \(err.description)")
                    }
                    
                    log("status: \(response.statusCode!)")
                    if response.statusCode == 201 {
                        log("account creation success")
                        if let payload = response.responseObject as? [String: AnyObject] {
                            var profile = payload["profile"] as! [String: AnyObject]
                            log("response: \(profile)")
                            self.currentUser = User(JSONDecoder(profile))
                            self.serverResponse = response.text
                            sendNext(observer, self.currentUser!)
                            sendCompleted(observer)
                        }
                    }else{
                        if let payload = response.responseObject as? [String: AnyObject] {
                            var message = payload["message"]!["message"] as! String
                            log("error: \(message)")
                            sendError(observer, NSError(domain: message, code: response.statusCode!, userInfo: nil))
                        }
                    }
                    
                })
            }
            
        }
        
        return signal
    }
    
}