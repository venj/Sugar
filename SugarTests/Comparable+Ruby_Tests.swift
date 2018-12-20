//
//  Comparable+Ruby_Tests.swift
//  Sugar Example
//
//  Created by Venj on 15/11/22.
//  Copyright © 2015年 Venj. All rights reserved.
//

import XCTest
@testable import Sugar

class ComparableRubyTests: XCTestCase {
    func testSpaceshipOperator() {
        let result1 = "a" <=> "b"
        let result2 = "b" <=> "b"
        let result3 = "c" <=> "b"
        let target1 = -1
        let target2 = 0
        let target3 = 1
        XCTAssertEqual(result1, target1)
        XCTAssertEqual(result2, target2)
        XCTAssertEqual(result3, target3)
    }
}
