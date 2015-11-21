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

    func testConcat() {
        let arr = [1 ,2 ,3]
        let result = arr.concat([4, 5, 6])
        let target = [1, 2, 3, 4, 5, 6]
        XCTAssertEqual(result, target)
    }

    func testCycle() {
        let arr = [1, 2, 3]
        var result = 0
        arr.cycle(2) {
            result += $0
        }
        let target = 12
        XCTAssertEqual(result, target)
    }

    func testDeleteAt() {
        var arr = [1, 2, 3]
        let deleted = arr.deleteAt(1)
        XCTAssertEqual(deleted, 2)
        XCTAssertEqual(arr, [1, 3])
        arr = [1, 2, 3]
        let deleted1 = arr.deleteAt(90)
        XCTAssertNil(deleted1)
        XCTAssertEqual(arr, [1, 2, 3])
    }

    func testDeleteIf() {
        var arr = [1, 2, 3, 4, 5, 6]
        arr.deleteIf() { $0 % 2 == 0 }
        XCTAssertEqual(arr, [1, 3, 5])
    }

    func testDrop() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = arr.drop(3)
        XCTAssertEqual(result, [4, 5, 6])
    }

    func testDropWhile() {
        let arr = [2, 4, 8, 4, 5, 6]
        let result = arr.dropWhile() { $0 % 2 == 0 }
        XCTAssertEqual(result, [5, 6])
    }

    func testEach() {
        let arr = [1, 2, 3, 4]
        var sum = 0
        arr.each() {
            sum += $0
        }
        XCTAssertEqual(sum, 10)
    }

    func testEachWithIndex() {
        let arr = [2, 4, 6, 8]
        var indexSum = 0
        var sum = 0
        arr.eachWithIndex() {
            indexSum += $0
            sum += $1
        }
        XCTAssertEqual(indexSum, 6)
        XCTAssertEqual(sum, 20)
    }

    func testFetch() {
        testAt()
    }

    func testFindIndex() {
        let arr = [6,3,4,7]
        let result1 = arr.findIndex(4)
        let result2 = arr.findIndex(9)
        XCTAssertEqual(result1, 2)
        XCTAssertNil(result2)
    }

    func testIndex() {
        testFindIndex()
    }

    func testKeepIf() {
        var arr = [1, 2, 3, 4]
        arr.keepIf() { $0 % 3 != 0 }
        XCTAssertEqual(arr, [1, 2, 4])
    }

    func testLength() {
        let arr = [1, 2, 3, 4]
        XCTAssertEqual(arr.length, 4)
    }

    func testMany() {
        let arr1 = [Int]()
        let result1 = arr1.many
        let arr2 = [1]
        let result2 = arr2.many
        let arr3 = [1, 2]
        let result3 = arr3.many
        XCTAssertFalse(result1)
        XCTAssertFalse(result2)
        XCTAssertTrue(result3)
    }

    func testPop() {
        var arr = [1, 2, 3, 4, 5, 6]
        let poped = arr.pop(3)
        XCTAssertEqual(arr, [1, 2, 3])
        XCTAssertEqual(poped, [4, 5, 6])
    }

    func testPrepend() {
        var arr = [1, 2, 3]
        arr.prepend(0)
        XCTAssertEqual(arr, [0, 1, 2, 3])
    }

    func testPush() {
        var arr = [1, 2, 3]
        arr.push(4)
        XCTAssertEqual(arr, [1, 2, 3, 4])
    }

    func testReplace() {
        var arr = [1, 2, 3]
        let replacement = [4, 5, 6]
        arr.replace(replacement)
        XCTAssertEqual(arr, replacement)
    }

    func testRIndex() {
        let arr = [1, 2, 2, 2, 2, 3]
        let result = arr.rIndex() {
            $0 % 2 == 0
        }
        let target = 4
        XCTAssertEqual(result, target)
    }

    func testRotate() {
        let arr = [1, 2, 3, 4]
        let leftRotate = arr.rotate(1)
        let leftTarget = [2, 3, 4, 1]
        let rightRotate = arr.rotate(-1)
        let rightTarget = [4, 1, 2, 3]
        XCTAssertEqual(leftRotate, leftTarget)
        XCTAssertEqual(rightRotate, rightTarget)
    }

}