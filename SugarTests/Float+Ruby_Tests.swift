//
//  Float+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/21.
//  Copyright © 2015年 Venj. All rights reserved.
//

import XCTest
@testable import Sugar

class FloatRubyTests: XCTestCase {
    func testDoubleStarOperator() {
        let result = Float(2.0) ** 3
        let target = Float(8.0)
        XCTAssertEqual(result, target)
    }
    
    func testAbs() {
        XCTAssertEqual(Float(-1.0).abs(), Float(1.0))
        XCTAssertEqual(Float(1.0).abs(), Float(1.0))
        XCTAssertEqual(Float(0.0).abs(), Float(0.0))
    }
}
