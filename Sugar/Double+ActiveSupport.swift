//
//  Double+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)
public extension Double {
    func fromNow() -> NSDate {
        return NSDate(timeIntervalSinceNow: self)
    }

    var hours: NSTimeInterval {
        return self * 60.minutes
    }

    var minutes: NSTimeInterval {
        return self * 60.seconds
    }

    var seconds: NSTimeInterval {
        return self
    }

    var days: NSTimeInterval {
        return self * 24.hours
    }

    var weeks: NSTimeInterval {
        return self * 7.days
    }

}