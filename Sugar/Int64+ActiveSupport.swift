//
//  Int64+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/12/11.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

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

// Only needed on 32-bit platform, because on 64-bit platform, Int and Int64 are the same.
#if !( arch(x86_64) || arch(arm64) )
@available(iOS 7.0, OSX 10.9, *)
public extension Int64 {
    /// Kilobytes in int.
    var kilobytes: Int64 {
        return Int64(1024)
    }

    /// Megabytes in int.
    var megabytes: Int64 {
        return Int64(1024) * kilobytes
    }

    /// Gigabytes in int.
    var gigabytes: Int64 {
        return Int64(1024) * megabytes
    }

    /// Terabytes in int.
    var terabytes: Int64 {
        return Int64(1024) * gigabytes
    }

    /// Petabytes in int.
    var petabytes: Int64 {
        return Int64(1024) * terabytes
    }

    /// Exabytes in int.
    var exabytes: Int64 {
        return Int64(1024) * petabytes
    }

    /// Shortcut for exabytes
    var eb: Int64 {
        return exabytes
    }

    /// Shortcut for petabytes
    var pb: Int64 {
        return petabytes
    }

    /// Shortcut for terabytes
    var tb: Int64 {
        return terabytes
    }

    /// Shortcut for gigabytes
    var gb: Int64 {
        return gigabytes
    }
    
    /// Shortcut for megabytes
    var mb: Int64 {
        return megabytes
    }

    /// Shortcut for kilobytes
    var kb: Int64 {
        return kilobytes
    }

    /// Hours in double
    var hours: TimeInterval {
        return Double(self) * 60.minutes
    }

    /// Minutes in double
    var minutes: TimeInterval {
        return Double(self) * 60.seconds
    }

    /// Seconds in double
    var seconds: TimeInterval {
        return Double(self)
    }

    /// Days in double
    var days: TimeInterval {
        return Double(self) * 24.hours
    }

    /// Weeks in double
    var weeks: TimeInterval {
        return Double(self) * 7.days
    }

    //TODO: months and years are a little tricky to implement, so do it later
}
#endif
