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
    /// Sunday. Day of week is 1.
    case Sunday = 1
    /// Monday. Day of week is 2.
    case Monday
    /// Tuesday. Day of week is 3.
    case Tuesday
    /// Wednesday. Day of week is 4.
    case Wednesday
    /// Thursday. Day of week is 5.
    case Thursday
    /// Friday. Day of week is 6.
    case Friday
    /// Saturday. Day of week is 7.
    case Saturday
}

/**
 Make `NSDate` comform to `Comparable` protocal.
*/
@available(iOS 7.0, OSX 10.9, *)
extension NSDate: Comparable {
}

/**
Some sugar for `NDDate`.  
*/
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
        cal.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        //cal.locale = NSLocale.currentLocale()
        return cal
    }

    /// Private property that parse a date into date components.
    private var __components: NSDateComponents {
        let comps = __calender.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekOfYear, .WeekOfMonth], fromDate: self)
        #if os(Linux)
        return comps!
        #else
        return comps
        #endif
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
        #if os(Linux)
        var components = NSDateComponents(coder:NSCoder())!
        #else
        var components = NSDateComponents()
        #endif
        components.year = __components.year
        components.month = 1
        components.day = 1
        let date = __calender.dateFromComponents(components)!
        #if os(Linux)
        components = __calender.components([.Weekday], fromDate: date)!
        #else
        components = __calender.components([.Weekday], fromDate: date)
        #endif
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
        #if os(Linux)
        let today = __calender.components([.Year, .Month, .Day], fromDate: NSDate())!
        #else
        let today = __calender.components([.Year, .Month, .Day], fromDate: NSDate())
        #endif
        if __components.year == today.year && __components.month == today.month && __components.day == today.day {
            return true
        }
        return false
    }
}