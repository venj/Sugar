//
//  String+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/20.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class StringRubyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // Test Operators

    func testDoublePercentOperator() {
        let str = "Int: %ld Float: %.2f, String: %@" %% [9999, 3.1415926, "hello world."]
        let target = "Int: 9999 Float: 3.14, String: hello world."
        XCTAssertEqual(str, target)
    }

    func testMultiplyOperator() {
        let str = "hello" * 3
        let target = "hellohellohello"
        XCTAssertEqual(str, target)
    }

    func testDoubleLTOperator() {
        let str1 = "hello " << "world"
        let target1 = "hello world"
        let str2 = "1 + 1 = " << 2
        let target2 = "1 + 1 = 2"
        XCTAssertEqual(str1, target1)
        XCTAssertEqual(str2, target2)
    }

    func testUUIDString() {
        let uuid1 = String.UUIDString()
        let uuid2 = String.UUIDString()
        XCTAssertNotEqual(uuid1, uuid2)
    }

    func testSubscriptInt() {
        let original = "Hello world"
        let part1 = original[0]
        let part2 = original[5]
        let part3 = original[-1]
        XCTAssertEqual(part1, "H")
        XCTAssertEqual(part2, " ")
        XCTAssertEqual(part3, "d")
    }

    func testSubscriptIntRange() {
        let original = "Hello world"
        let part1 = original[0...5]
        let part2 = original[1..<4]
        XCTAssertEqual(part1, "Hello ")
        XCTAssertEqual(part2, "ell")
    }

    func testSubscriptRangeIndex() {
        let original = "Hello world"
        let range:Range<String.CharacterView.Index> = Range<String.CharacterView.Index>(start:original.startIndex, end:original.startIndex.advancedBy(3))
        let part = original[range]
        XCTAssertEqual(part, "Hel")
    }

    func testSubscriptNSRange() {
        let original = "Hello world"
        let nsrange = NSRange(location: 1, length: 3)
        let part = original[nsrange]
        XCTAssertEqual(part, "ell")
    }

    func testCapitalize() {
        let original = "the arrow"
        XCTAssertEqual(original.capitalize(), "The Arrow")
    }


    func testCaseCmp() {
        let result1 = "abc".casecmp("Abc") == 0
        let result2 = "abcd".casecmp("Abc") == 1
        let result3 = "abc".casecmp("Abd") == -1
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
        XCTAssertTrue(result3)
    }

    func testCenter() {
        let original = "abc"
        let center1 = original.center(10)
        let center2 = original.center(10, padString: "-")
        let center3 = original.center(5, padString: "x*x")
        let center4 = original.center(7, padString: "x*x")
        XCTAssertEqual(center1, "   abc    ")
        XCTAssertEqual(center2, "---abc----")
        XCTAssertEqual(center3, "xabcx")
        XCTAssertEqual(center4, "x*abcx*")
    }

    func testChomp() {
        let result1 = "hello".chomp()
        let result2 = "hello\n".chomp()
        let result3 = "hello\r\n".chomp()
        let result4 = "hello\n\r".chomp()
        let result5 = "hello\r".chomp()
        let result6 = "hello \n there".chomp()
        let result7 = "hello".chomp("llo")
        let result8 = "hello\r\n\r\n".chomp("")
        let result9 = "hello\r\n\r\r\n".chomp("")
        let result10 = "llollollollohellollllollollo".chomp("llo")

        XCTAssertEqual(result1, "hello")
        XCTAssertEqual(result2, "hello")
        XCTAssertEqual(result3, "hello")
        XCTAssertEqual(result4, "hello\n")
        XCTAssertEqual(result5, "hello")
        XCTAssertEqual(result6, "hello \n there")
        XCTAssertEqual(result7, "he")
        XCTAssertEqual(result8, "hello")
        XCTAssertEqual(result9, "hello\r\n\r")
        XCTAssertEqual(result10, "helloll")
    }

    func testChop() {
        let str = "Hello"
        XCTAssertEqual(str.chop(), "Hell")
    }

    func testChopInPlace() {
        var str = "Hello"
        str.chopInPlace()
        XCTAssertEqual(str, "Hell")
    }

    func testClear() {
        var str = "Some String"
        str.clear()
        XCTAssertEqual(str, "")
    }

    func testConcat() {
        let str1 = "hello ".concat("world")
        let target1 = "hello world"
        let str2 = "1 + 1 = ".concat(2)
        let target2 = "1 + 1 = 2"
        XCTAssertEqual(str1, target1)
        XCTAssertEqual(str2, target2)
    }
    
}