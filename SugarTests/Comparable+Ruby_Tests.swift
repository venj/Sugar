//
//  Comparable+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/22.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
@testable import Sugar_iOS

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
