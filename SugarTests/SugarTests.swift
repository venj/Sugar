//
//  SugarTests.swift
//  SugarTests
//
//  Created by 朱文杰 on 15/11/11.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class SugarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //MARK: - Tests for String+Hash.swift
    func testStringMD2() {
        let str = "Hello world."
        XCTAssertEqual(str.md2.downcase(), "9a23cfa6aae6635b88d8d2ee28b23bc8")
    }

    func testStringMD4() {
        let str = "Hello world."
        XCTAssertEqual(str.md4.downcase(), "88047f1d6662a47837c3c4c33a9223d2")
    }

    func testStringMD5() {
        let str = "Hello world."
        XCTAssertEqual(str.md5.downcase(), "764569e58f53ea8b6404f6fa7fc0247f")
    }

    func testStringSHA1() {
        let str = "Hello world."
        XCTAssertEqual(str.sha1.downcase(), "e44f3364019d18a151cab7072b5a40bb5b3e274f")
    }

    func testStringSHA224() {
        let str = "Hello world."
        XCTAssertEqual(str.sha224.downcase(), "b6447649657a819c48badccc1fd393c4147c46cb5930f19cf7b45c4e")
    }

    func testStringSHA256() {
        let str = "Hello world."
        XCTAssertEqual(str.sha256.downcase(), "aa3ec16e6acc809d8b2818662276256abfd2f1b441cb51574933f3d4bd115d11")
    }

    func testStringSHA384() {
        let str = "Hello world."
        XCTAssertEqual(str.sha384.downcase(), "32586bbcff8fb516d0e9eb8f7521a7658263a0cbdaea4f0d89d86995882fec290d5505688ff0988323339366c96ecad2")
    }

    func testStringSHA512() {
        let str = "Hello world."
        XCTAssertEqual(str.sha512.downcase(), "70f460361a639767d665c14727b2f18bed18c8c6be6a6ad3950e976167ba57a8db214ac3ded3d7777e5eb20ea61a2f8a24d026d285cab4ba4d38dc1c410136f7")
    }

    func testStringHMACMD5() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacMD5(hmacKey).downcase(), "3acb93f70cfdc57de765123de7749cab")
    }

    func testStringHMACSHA1() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacSHA1(hmacKey).downcase(), "5787dbcc3f91b80d02a553eaedf2964133477058")
    }

    func testStringHMACSHA224() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacSHA224(hmacKey).downcase(), "4e57411f438781724641a087f177cd995f2aee92c7ef5fb8ba748fed")
    }

    func testStringHMACSHA256() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacSHA256(hmacKey).downcase(), "fea9aeb5251f1df69d209ada3f5f7250ae4e71eddfb860d0b3354e9e4cf4e190")
    }

    func testStringHMACSHA384() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacSHA384(hmacKey).downcase(), "8c2ac0f3291c513fa74f3243160b77c6f427f191ab7c9d9b17f2317c0d8460c8c50112fcb715642e5a5abfc3a8ca0beb")
    }

    func testStringHMACSHA512() {
        let hmacKey = "Swift"
        let str = "Hello world."
        XCTAssertEqual(str.hmacSHA512(hmacKey).downcase(), "79f0fbaf68229f58ba84d8dc86ebd76dbd9457f28515e625f158a9a939f0b0ebefe804e8a72942c404184ef357f4614ac79cc1fa136d54383f6e718c12c17440")
    }

    //MARK: - Tests for String+URLEncode.swift
    func testPercentEncodedString() {
        let str = "% /".percentEncodedString
        let encodedString = "%25%20%2F"
        XCTAssertEqual(str, encodedString)
    }

    //MARK: - Tests for Operators+General.swift

    func testStringAddInt() {
        let str = "3"
        let i = 2
        let expected = "32"
        let actual = str +! i
        XCTAssertEqual(actual, expected)
    }

    func testIntAddString() {
        let str = "3"
        let i = 2
        let expected = 5
        let actual = i +! str
        XCTAssertEqual(actual, expected)
    }

    func testIntAddStringNotConvertableToInt() {
        let str = "K3"
        let i = 2
        let expected = 2
        let actual = i +! str
        XCTAssertEqual(actual, expected)
    }

    func testIntAddDouble() {
        let d: Double = 2.14
        let i: Int = 1
        let expected = 3.14
        let actual = i +! d
        XCTAssertEqual(actual, expected)
    }

    func testDoubleAddInt() {
        let d: Double = 2.14
        let i: Int = 1
        let expected = 3.14
        let actual = d +! i
        XCTAssertEqual(actual, expected)
    }
    
}
