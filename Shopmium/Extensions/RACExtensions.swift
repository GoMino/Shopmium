//
//  RACSignal.swift
//  innerly
//
//  Created by Gomino on 06/09/2014.
//  Copyright (c) 2014 labgency. All rights reserved.
//

import Foundation
import ReactiveCocoa

extension RACSignal {
//    func subscribeNextAs<T>(nextClosure:(T) -> ()) -> () {
//        self.subscribeNext {
//            (next: AnyObject!) -> () in
//            if let nextAsT = next as? T{
//                nextClosure(nextAsT)
//            }
//        }
//    }
    
//    func subscribeNextAs<T>(nextClosure:(T) -> ()) -> () {
//        self.subscribeNext {
//            (next: AnyObject!) -> () in
//            let nextAsT = next! as T
//            nextClosure(nextAsT)
//        }
//    }
    
    func subscribeNextAs<T>(block: (T) -> ()) -> RACDisposable {
        return subscribeNext({(value: AnyObject!) in
            if let casted = value as? T {
                block(casted)
            }
        })
    }
    
    
}

extension RACStream {
    
    func mapAs<T,U: AnyObject>(block: (T) -> U) -> Self {
        return map({(value: AnyObject!) in
            if let casted = value as? T {
                return block(casted)
            }
            return nil
        })
    }
    
    func filterAs<T>(block: (T) -> Bool) -> Self {
        return filter({(value: AnyObject!) in
            if let casted = value as? T {
                return block(casted)
            }
            return false
        })
    }
}

// a struct that replaces the RAC macro
struct RAC  {
    var target : NSObject!
    var keyPath : String!
    var nilValue : AnyObject!
    
    init(_ target: NSObject!, _ keyPath: String, nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal : RACSignal) {
        signal.setKeyPath(self.keyPath, onObject: self.target, nilValue: self.nilValue)
    }
}

infix operator ~> {}

func ~> (signal: RACSignal, rac: RAC) {
    rac.assignSignal(signal)
}

func RACObserve(target: NSObject!, keyPath: String) -> RACSignal!  {
    //return target.rac_valuesAndChangesForKeyPath(keyPath, options: NSKeyValueObservingOptions.allZeros, observer: target)
    return target.rac_valuesForKeyPath(keyPath, observer: target)
}