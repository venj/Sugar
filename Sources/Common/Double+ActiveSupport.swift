//
//  Double+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//
/**
Active Support flavored extension for Double.
*/
import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension Double {

    /**
     Calculate a date with a time interval from now.

     - returns: A future date.
     */
    func fromNow() -> NSDate {
        return NSDate(timeIntervalSinceNow: self)
    }

    /**
     Calculate a date with a time interval before now.

     - returns: A previous date.
     */
    func ago() -> NSDate {
        return NSDate(timeIntervalSinceNow: -self)
    }

    /// Hours in double
    var hours: NSTimeInterval {
        return self * 60.minutes
    }

    /// Minutes in double
    var minutes: NSTimeInterval {
        return self * 60.seconds
    }

    /// Seconds in double
    var seconds: NSTimeInterval {
        return self
    }

    /// Days in double
    var days: NSTimeInterval {
        return self * 24.hours
    }

    /// Weeks in double
    var weeks: NSTimeInterval {
        return self * 7.days
    }
}