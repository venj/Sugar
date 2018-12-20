//
//  Double+ActiveSupport.swift
//  Sugar
//
//  Created by Venj on 15/11/19.
//  Copyright © 2015年 Venj. All rights reserved.
//
/**
Active Support flavored extension for Double.
*/
import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension Double {

    /**
     Calculate a date with a time interval from now.

     - returns: A future date.
     */
    func fromNow() -> Date {
        return Date(timeIntervalSinceNow: self)
    }

    /**
     Calculate a date with a time interval before now.

     - returns: A previous date.
     */
    func ago() -> Date {
        return Date(timeIntervalSinceNow: -self)
    }

    /// Hours in double
    var hours: TimeInterval {
        return self * 60.minutes
    }

    /// Minutes in double
    var minutes: TimeInterval {
        return self * 60.seconds
    }

    /// Seconds in double
    var seconds: TimeInterval {
        return self
    }

    /// Days in double
    var days: TimeInterval {
        return self * 24.hours
    }

    /// Weeks in double
    var weeks: TimeInterval {
        return self * 7.days
    }
}
