//
//  NSDate+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/22.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation
import XCTest
@testable import Sugar_iOS

class NSDateRubyTests: XCTestCase {
    var date: NSDate!
    override func setUp() {
        super.setUp()
        date = NSDate(timeIntervalSince1970: 365.25 * 45 * 24 * 3600 + 8 * 3600 + 10 * 60 + 15) // 2015-1-1 14:10:15 UTC
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCompareOperator() {
        let date1 = NSDate()
        usleep(1000)
        let date2 = NSDate()
        let result = (date1 < date2)
        XCTAssertTrue(result)
    }

    func testIsIt() {
        let result = date.isIt(.Thursday)
        XCTAssertTrue(result)
    }

    func testYear() {
        XCTAssertEqual(date.year, 2015)
    }

    func testMonth() {
        XCTAssertEqual(date.month, 1)
    }

    func testDay() {
        XCTAssertEqual(date.day, 1)
    }

    func testHour() {
        XCTAssertEqual(date.hour, 14)
    }

    func testMinute() {
        XCTAssertEqual(date.minute, 10)
    }

    func testSecond() {
        XCTAssertEqual(date.second, 15)
    }

    func testYDay() {
        XCTAssertEqual(date.yday, 1)
    }

    func testYWeek() {
        XCTAssertEqual(date.yweek, 1)
    }

    func testMweek() {
        XCTAssertEqual(date.mweek, 1)
    }

    func testMday() {
        XCTAssertEqual(date.mday, 1)
    }

    func testIsToday() {
        XCTAssertFalse(date.isToday())
        XCTAssertTrue(NSDate().isToday())
    }
}
