//
//  Double+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/21.
//  Copyright © 2015年 Venj. All rights reserved.
//

import XCTest
@testable import Sugar

class DoubleRubyTests: XCTestCase {
    func testDoubleStarOperator() {
        let result = 2.0 ** 3
        let target = 8.0
        XCTAssertEqual(result, target)
    }
    
    func testAbs() {
        XCTAssertEqual((-1.0).abs(), 1.0)
        XCTAssertEqual(1.0.abs(), 1.0)
        XCTAssertEqual(0.0.abs(), 0.0)
    }
}
