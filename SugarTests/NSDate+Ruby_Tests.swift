//
//  NSDate+Ruby_Tests.swift
//  Sugar Example
//
//  Created by Venj on 15/11/22.
//  Copyright © 2015年 Venj. All rights reserved.
//

import Foundation
import XCTest
@testable import Sugar

class NSDateRubyTests: XCTestCase {
    var date: Date!
    override func setUp() {
        super.setUp()
        date = Date(timeIntervalSince1970: 365.25 * 45 * 24 * 3600 + 8 * 3600 + 10 * 60 + 15) // 2015-1-1 14:10:15 UTC
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIsIt() {
        let result = date.isIt(.thursday)
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
        XCTAssertTrue(Date().isToday())
    }
}
