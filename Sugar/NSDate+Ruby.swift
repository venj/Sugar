//
//  NSDate+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

/**
 All seven week days.
*/
public enum WeekDay: Int {
    case Sunday = 1
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

/**
Compare two `NSDate`. Earlier date is smaller.
*/
@available(iOS 7.0, OSX 10.9, *)
@warn_unused_result public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    let lhsTimeStamp = lhs.timeIntervalSince1970
    let rhsTimeStamp = rhs.timeIntervalSince1970
    return (rhsTimeStamp - lhsTimeStamp) > 0
}

/**
 Make `NSDate` comform to `Comparable` protocal.
*/
@available(iOS 7.0, OSX 10.9, *)
extension NSDate: Comparable {
}

@available(iOS 7.0, OSX 10.9, *)
public extension NSDate {
    /**
     Examine whether a `NSDate` object is a certain weekday.
    */
    func isIt(weekDay: WeekDay) -> Bool {
        return __components.weekday == weekDay.rawValue ? true : false
    }

    /// Private property that return a calender object.
    private var __calender: NSCalendar {
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        cal.locale = NSLocale.currentLocale()
        return cal
    }

    /// Private property that parse a date into date components.
    private var __components: NSDateComponents {
        return __calender.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekOfYear, .WeekOfMonth], fromDate: self)
    }

    /// Year of the date object.
    var year: Int {
        return __components.year
    }

    /// Month of the date object.
    var month: Int {
        return __components.month
    }

    /// Day of the date object.
    var day: Int {
        return __components.day
    }

    /// Hour of the date object.
    var hour: Int {
        return __components.hour
    }

    /// Minute of the date object.
    var minute: Int {
        return __components.minute
    }

    /// Second of the date object.
    var second: Int {
        return __components.second
    }

    // very lame implementation to get day of year
    /// Day number in the year.
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

    /// Week number in month.
    var mweek: Int {
        return __components.weekOfMonth
    }

    /// Week number in the year
    var yweek: Int {
        return __components.weekOfYear
    }

    /// Day number in the month
    var mday: Int {
        return day
    }

    //TODO: implement strftime()
    /**
    Determine whether the date object is today. 
    
    - returns: A boolean indicate whether it is today. 
    */
    func isToday() -> Bool {
        let today = __calender.components([.Year, .Month, .Day], fromDate: NSDate())
        if __components.year == today.year && __components.month == today.month && __components.day == today.day {
            return true
        }
        return false
    }
}