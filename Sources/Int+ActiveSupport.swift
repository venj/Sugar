//
//  Int+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

// Notice for 32-bit: Following code may overflow on 32-bit platform
/**
Active Support flavored extension for Int.
*/
import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension Int {
    /// Kilobytes in int.
    var kilobytes: Int {
        return 1024
    }

    /// Megabytes in int.
    var megabytes: Int {
        return 1024 * kilobytes
    }

    /// Gigabytes in int.
    var gigabytes: Int {
        return 1024 * megabytes
    }

    /// Terabytes in int.
    var terabytes: Int {
        return 1024 * gigabytes
    }

    /// Petabytes in int.
    var petabytes: Int {
        return 1024 * terabytes
    }

    /// Exabytes in int.
    var exabytes: Int {
        return 1024 * petabytes
    }

    /// Shortcut for exabytes
    var eb: Int {
        return exabytes
    }

    /// Shortcut for petabytes
    var pb: Int {
        return petabytes
    }

    /// Shortcut for terabytes
    var tb: Int {
        return terabytes
    }

    /// Shortcut for gigabytes
    var gb: Int {
        return gigabytes
    }

    /// Shortcut for megabytes
    var mb: Int {
        return megabytes
    }

    /// Shortcut for kilobytes
    var kb: Int {
        return kilobytes
    }

    /// Hours in double
    var hours: NSTimeInterval {
        return Double(self) * 60.minutes
    }

    /// Minutes in double
    var minutes: NSTimeInterval {
        return Double(self) * 60.seconds
    }

    /// Seconds in double
    var seconds: NSTimeInterval {
        return Double(self)
    }

    /// Days in double
    var days: NSTimeInterval {
        return Double(self) * 24.hours
    }

    /// Weeks in double
    var weeks: NSTimeInterval {
        return Double(self) * 7.days
    }

    //TODO: months and years are a little tricky to implement, so do it later

}