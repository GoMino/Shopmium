//
//  SwiftExtensions.swift
//  innerly
//
//  Created by Gregory Potdevin on 16/09/2014.
//  Copyright (c) 2014 labgency. All rights reserved.
//

import Foundation

//FROM http://ijoshsmith.com/2014/07/05/custom-threading-operator-in-swift/
infix operator ~> {}

/** Serial dispatch queue used buy the ~> operator. */
private let queue = dispatch_queue_create("serial-worker", DISPATCH_QUEUE_SERIAL)

/**
Executes the lefthand closure on a background thread and; upon completion, the righthand closure on the main thread.
*/
func ~> (
    backgroundClosure: () -> (),
    mainClosure:   () -> ())
{
    dispatch_async(queue){
        backgroundClosure()
        dispatch_async(dispatch_get_main_queue(), mainClosure)
    }
}

/**
Executes the lefthand closure on a background thread and, upon completion, the righthand closure on the main thread.
Passes the background closure's output to the main closure
*/
func ~> <R> (
    backgroundClosure: () -> R,
    mainClosure:   (result:R) -> ())
{
    dispatch_async(queue){
        let result = backgroundClosure()
        dispatch_async(dispatch_get_main_queue(), {
            mainClosure(result: result)
        })
    }
}

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

func noop<T> (_ fn: (Void -> Void)? = nil ) -> ( T -> Void)
{
    return { _ in fn?(); return }
}

//func noop<T> (fn:@autoclosure () -> () = nil) -> ( T -> Void )
//{
//    return noop{ fn() }
//}

func noop () -> Void
{
    
}