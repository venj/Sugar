//
//  Int+ActiveSupport_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/22.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class IntActiveSupportTests: XCTestCase {
    func testKilobytes() {
        let result = 1.kilobytes
        let target = Int64(1024)
        XCTAssertEqual(result, target)
    }

    func testMegaBytes() {
        let result = 1.megabytes
        let target = Int64(1024 * 1024)
        XCTAssertEqual(result, target)
    }

    func testGigabytes() {
        let result = 1.gigabytes
        let target = Int64(1024) ** 3
        XCTAssertEqual(result, target)
    }

    func testTeraBytes() {
        let result = 1.terabytes
        let target = Int64(1024) ** 4
        XCTAssertEqual(result, target)
    }

    func testPetaBytes() {
        let result = 1.petabytes
        let target = Int64(1024) ** 5
        XCTAssertEqual(result, target)
    }

    func testExabytes() {
        let result = 1.exabytes
        let target = Int64(1024) ** 6
        XCTAssertEqual(result, target)
    }

    func testKb() {
        testKilobytes()
    }

    func testMb() {
        testMegaBytes()
    }

    func testGb() {
        testGigabytes()
    }

    #if ( arch(x86_64) || arch(arm64) )
    func testTb() {
        testTeraBytes()
    }

    func testPb() {
        testPetaBytes()
    }

    func testEb() {
        testExabytes()
    }
    #endif

    func testHours() {
        let result = 1.hours
        let target = 3600.0
        XCTAssertEqual(result, target)
    }

    func testSeconds() {
        let result = 1.seconds
        let target = 1.0
        XCTAssertEqual(result, target)
    }

    func testMinutes() {
        let result = 1.minutes
        let target = 60.0
        XCTAssertEqual(result, target)
    }

    func testDays() {
        let result = 1.days
        let target = 24.0 * 3600.0
        XCTAssertEqual(result, target)
    }

    func testWeeks() {
        let result = 1.weeks
        let target = 24.0 * 3600.0 * 7.0
        XCTAssertEqual(result, target)
    }
}
