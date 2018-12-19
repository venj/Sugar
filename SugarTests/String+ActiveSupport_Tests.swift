//
//  String+ActiveSupport_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/22.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class StringActiveSupportTests: XCTestCase {
    func testAtIntPosition() {
        let str = "Hello"
        let result = str.at(1)
        let target = "e"
        XCTAssertEqual(result, target)
    }

    func testAtIndex() {
        let str = "Hello"
        let index = str.index(str.startIndex, offsetBy: 1)
        let result = str.at(index)
        let target = "e"
        XCTAssertEqual(result, target)
    }

    func testAtIntRange() {
        let str = "Hello"
        let range = 1...3
        let result = str.at(range)
        let target = "ell"
        XCTAssertEqual(result, target)
    }

    func testAtRegex() {
        let str = "Hello"
        let result = str.at("l+")
        let target = "ll"
        XCTAssertEqual(result, target)
    }

    func testExclude() {
        let str = "hello"
        XCTAssertTrue(str.exclude("ow"))
        XCTAssertFalse(str.exclude("ll"))
    }

    func testFirst() {
        let str = "hello"
        let result1 = str.first(-1)
        let result2 = str.first(2)
        let result3 = str.first(100)
        let target1 = ""
        let target2 = "he"
        let target3 = str
        XCTAssertEqual(result1, target1)
        XCTAssertEqual(result2, target2)
        XCTAssertEqual(result3, target3)
    }

    func testLast() {
        let str = "hello"
        let result1 = str.last(-1)
        let result2 = str.last(2)
        let result3 = str.last(100)
        let target1 = ""
        let target2 = "lo"
        let target3 = str
        XCTAssertEqual(result1, target1)
        XCTAssertEqual(result2, target2)
        XCTAssertEqual(result3, target3)
    }

    func testRemove() {
        let str = "hello"
        let result = str.remove("l+o")
        let target = "he"
        XCTAssertEqual(result, target)
    }

    func testRemoveInPlace() {
        var str = "hello"
        _ = str.removeInPlace("l+o")
        let target = "he"
        XCTAssertEqual(str, target)
    }

    func testSquish() {
        let str = "   Hello    world!   "
        let result = str.squish()
        let target = "Hello world!"
        XCTAssertEqual(result, target)
    }

    func testSquishInPlace() {
        var str = "   Hello    world!   "
        _ = str.squishInPlace()
        let target = "Hello world!"
        XCTAssertEqual(str, target)
    }
}
