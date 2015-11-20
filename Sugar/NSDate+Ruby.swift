//
//  NSDate+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

public enum WeekDay: Int {
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

@available(iOS 7.0, OSX 10.9, *)
@warn_unused_result public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    let lhsTimeStamp = lhs.timeIntervalSince1970
    let rhsTimeStamp = rhs.timeIntervalSince1970
    return (rhsTimeStamp - lhsTimeStamp) > 0
}

@available(iOS 7.0, OSX 10.9, *)
extension NSDate: Comparable {
}

@available(iOS 7.0, OSX 10.9, *)
public extension NSDate {
    func isIt(weekDay: WeekDay) -> Bool {
        return __components.weekday == weekDay.rawValue ? true : false
    }

    private var __calender: NSCalendar {
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        cal.locale = NSLocale.currentLocale()
        return cal
    }

    var __components: NSDateComponents {
        return __calender.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekOfYear, .WeekOfMonth], fromDate: self)
    }

    var year: Int {
        return __components.year
    }

    var month: Int {
        return __components.month
    }

    var day: Int {
        return __components.day
    }

    var hour: Int {
        return __components.hour
    }

    var minute: Int {
        return __components.minute
    }

    var second: Int {
        return __components.second
    }

    // very lame implementation to get day of year
    var yday: Int {
        var days = (__components.weekOfYear - 1) * 7 + __components.weekday
        var components = NSDateComponents()
        components.year = __components.year
        components.month = 1
        components.day = 1
        let date = __calender.dateFromComponents(components)!
        components = __calender.components([.Weekday], fromDate: date)
        days = days - components.weekday + 1
        return days
    }

    var mweek: Int {
        return __components.weekOfMonth
    }

    var yweek: Int {
        return __components.weekOfYear
    }

    var mday: Int {
        return day
    }

    //TODO: implement strftime()
    
    func isToday() -> Bool {
        let today = __calender.components([.Year, .Month, .Day], fromDate: NSDate())
        if __components.year == today.year && __components.month == today.month && __components.day == today.day {
            return true
        }
        return false
    }
}