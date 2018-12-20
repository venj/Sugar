//
//  RegularExpression+Ruby_Tests.swift
//  Sugar Example
//
//  Created by Venj on 15/11/22.
//  Copyright © 2015年 Venj. All rights reserved.
//

import XCTest
@testable import Sugar

class RegularExpressionRubyTests: XCTestCase {
    func testMatchExpression() {
        let pattern1 = "\\d+"
        let pattern2 = "^\\w+$"
        let string = "Here are some numbers: 123."
        let result1 = string =~ pattern1
        let result2 = string !~ pattern2
        XCTAssertTrue(result1 != nil)
        XCTAssertTrue(result2)
    }
}
