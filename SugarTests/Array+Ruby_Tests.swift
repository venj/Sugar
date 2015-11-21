//
//  Array+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/21.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
@testable import Sugar

class ArrayRubyTests: XCTestCase {
    func testMultiplyOperator() {
        let arr = [1, 2, 3]
        let result = arr * 3
        let target = [1, 2, 3, 1, 2, 3, 1, 2, 3]
        XCTAssertEqual(result, target)
    }
    
    func testPlusOperator() {
        let arr = [1, 2, 3]
        let result = arr + [4, 5, 6]
        let target = [1, 2, 3, 4, 5, 6]
        XCTAssertEqual(result, target)
    }
    
    func testDoubleLTOperator() {
        let arr = [1, 2, 3]
        let result1 = arr << 4
        let target1 = [1, 2, 3, 4]
        let result2 = arr << arr
        let target2 = [1 , 2, 3, 1, 2, 3]
        XCTAssertEqual(result1, target1)
        XCTAssertEqual(result2, target2)
    }
    
    func testAnyIf() {
        let a = ["a", "b", "c"]
        let result = a.anyIf("b", ==)
        XCTAssertTrue(result)
    }
    
    func testAt() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result1 = arr.at(2)
        let result2 = arr.at(10)
        let result3 = arr.at(-2)
        let result4 = arr.at(-99)
        XCTAssertEqual(result1, 3)
        XCTAssertNil(result2)
        XCTAssertEqual(result3, 5)
        XCTAssertNil(result4)
    }
    
    func testClear() {
        var arr = [1, 3, 5]
        arr.clear()
        XCTAssertTrue(arr.isEmpty)
    }
    
    func testCollect() {
        let arr = [1, 2, 3, 4, 5]
        let result = arr.collect {
            $0 * 2
        }
        let target = [2, 4, 6, 8, 10]
        XCTAssertEqual(result, target)
    }
    
    
}