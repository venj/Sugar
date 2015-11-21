//
//  Int+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/21.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class IntRubyTests: XCTestCase {
    func testSquareOperator() {
        let result = 2 ** 3
        let target = 8
        XCTAssertEqual(result, target)
    }
    
    func testAbs() {
        XCTAssertEqual((-1).abs(), 1)
        XCTAssertEqual(1.abs(), 1)
        XCTAssertEqual(0.abs(), 0)
    }
    
    func testDownTo() {
        var sum = 0
        5.downTo(1) {
            sum += $0
        }
        XCTAssertEqual(sum, 15)
        sum = 0
        5.downTo(10) {
            sum += $0
        }
        XCTAssertEqual(sum, 5)
    }
    
    func testGcd() {
        let gcd1 = 9.gcd(27)
        let gcd2 = 15.gcd(21)
        XCTAssertEqual(gcd1, 9)
        XCTAssertEqual(gcd2, 3)
    }
    
    func testGcdlcm() {
        let gcdlcm1 = 9.gcdlcm(27)
        XCTAssertEqual(gcdlcm1.gcd, 9)
        XCTAssertEqual(gcdlcm1.lcm, 27)
        let gcdlcm2 = 15.gcdlcm(21)
        XCTAssertEqual(gcdlcm2.gcd, 3)
        XCTAssertEqual(gcdlcm2.lcm, 105)
    }
    
    func testlcm() {
        let lcm1 = 9.lcm(27)
        let lcm2 = 15.lcm(21)
        XCTAssertEqual(lcm1, 27)
        XCTAssertEqual(lcm2, 105)
    }
    
    func testIsEven() {
        XCTAssertTrue(2.isEven())
        XCTAssertFalse((-1).isEven())
    }
    
    func testIsOdd() {
        XCTAssertTrue(1.isOdd())
        XCTAssertFalse((-2).isOdd())
    }
    
    func testNext() {
        XCTAssertEqual((-3).next(), -2)
        XCTAssertEqual(3.next(), 4)
    }
    
    func testPred() {
        XCTAssertEqual((-3).pred(), -4)
        XCTAssertEqual(3.pred(), 2)
    }
    
    func testSucc() {
        XCTAssertEqual((-3).succ(), -2)
        XCTAssertEqual(3.succ(), 4)
    }
    
    func testTime() {
        var str = ""
        5.times() { _ in str += "s"}
        XCTAssertEqual(str, "sssss")
    }
    
    func testUpTo() {
        var sum = 0
        1.upTo(5) {
            sum += $0
        }
        XCTAssertEqual(sum, 15)
        sum = 0
        5.upTo(1) {
            sum += $0
        }
        XCTAssertEqual(sum, 5)
    }
}