//
//  Dictionary+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/22.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
@testable import Sugar

class DictionaryRubyTests: XCTestCase {
    func testClear() {
        var dict = ["a": 1, "b": 2]
        dict.clear()
        let target:[String: Int] = [:]
        XCTAssertEqual(dict, target)
    }

    func testDelete() {
        var dict = ["a": 1, "b": 2, "c": 3]
        var result: String = ""
        dict.delete("a") {
            result = $0 + " not found"
        }
        XCTAssertEqual(dict, ["b": 2, "c": 3])
        dict.delete("d") {
            result = $0 + " not found"
        }
        XCTAssertEqual(dict, ["b": 2, "c": 3])
        XCTAssertEqual(result, "d not found")
    }

    func testDeleteIf() {
        var dict = ["a": 1, "b": 2, "c": 3]
        dict.deleteIf() {
            $1 > 2
        }
        let target = ["a": 1, "b": 2]
        XCTAssertEqual(dict, target)
    }

    func testEach() {
        let dict = ["a": 1, "b": 2, "c": 3]
        var keySum = Set<String>()
        var valueSum = 0
        dict.each() {
            keySum.insert($0)
            valueSum += $1
        }
        let destination = Set<String>(["a", "b", "c"])
        XCTAssertEqual(keySum, destination)
        XCTAssertEqual(valueSum, 6)
    }

    func testEachKey() {
        let dict = ["a": 1, "b": 2, "c": 3]
        var keySum = Set<String>()
        dict.eachKey() {
            keySum.insert($0)
        }
        let destination = Set<String>(["a", "b", "c"])
        XCTAssertEqual(keySum, destination)
    }

    func testEachValue() {
        let dict = ["a": 1, "b": 2, "c": 3]
        var valueSum = 0
        dict.eachValue() {
            valueSum += $0
        }
        XCTAssertEqual(valueSum, 6)
    }

    func testFetch() {
        let dict = ["a": 1, "b": 2, "c": 3]
        var result = ""
        let fetched1 = dict.fetch("b") {
            result = $0 + " not found"
        }
        XCTAssertEqual(fetched1, 2)
        XCTAssertEqual(result, "")
        let fetched2 = dict.fetch("e") {
            result = $0 + " not found"
        }
        XCTAssertNil(fetched2)
        XCTAssertEqual(result, "e not found")
    }

    func testHasKey() {
        let dict = ["a": 1, "b": 2, "c": 3]
        XCTAssertTrue(dict.hasKey("a"))
        XCTAssertFalse(dict.hasKey("f"))
    }

    func testInclude() {
        testHasKey()
    }

    func testKeepIf() {
        var dict = ["a": 1, "b": 2, "c": 3, "d": 2]
        dict.keepIf() {
            $0 < "c" && $1 < 3
        }
        let target = ["a": 1, "b": 2]
        XCTAssertEqual(dict, target)
    }

    func testLength() {
        let dict = ["a": 1, "b": 2, "c": 3, "d": 2]
        let result = dict.length
        let target = 4
        XCTAssertEqual(result, target)
    }

    func testIsMember() {
        testHasKey()
    }

    func testMerge() {
        let dict1 = ["a": 1, "b": 2, "c": 3]
        let dict2 = ["c": 4, "d": 5, "e": 6]
        let result = dict1.merge(dict2)
        let target = ["a": 1, "b": 2, "c": 4, "d": 5, "e": 6]
        XCTAssertEqual(result, target)
    }

    func testMergeInPlace() {
        var dict1 = ["a": 1, "b": 2, "c": 3]
        let dict2 = ["c": 4, "d": 5, "e": 6]
        dict1.mergeInPlace(dict2)
        let target = ["a": 1, "b": 2, "c": 4, "d": 5, "e": 6]
        XCTAssertEqual(dict1, target)
    }

    func testReject() {
        let dict = ["a": 1, "b": 2, "c": 3]
        let result = dict.reject() {
            $1 > 2
        }
        let target = ["a": 1, "b": 2]
        XCTAssertEqual(result, target)
    }

    func testRejectInPlace() {
        var dict = ["a": 1, "b": 2, "c": 3]
        dict.rejectInPlace() {
            $1 > 2
        }
        let target = ["a": 1, "b": 2]
        XCTAssertEqual(dict, target)
    }

    func testReplace() {
        var dict = ["a": 1, "b": 2, "c": 3]
        let target = ["d": 99]
        dict.replace(target)
        XCTAssertEqual(dict, target)
    }

    func testSelect() {
        let dict = ["a": 1, "b": 2, "c": 3]
        let selected = dict.select() {
            $1 > 2
        }
        let target = ["c": 3]
        XCTAssertEqual(selected, target)
    }

    func testSelectInPlace() {
        var dict = ["a": 1, "b": 2, "c": 3]
        let result = dict.selectInPlace() {
            $1 > 2
        }
        let target = ["c": 3]
        XCTAssertEqual(dict, target)
        XCTAssertEqual(result!, target)
        let result2 = dict.selectInPlace() {
            $1 < 4
        }
        XCTAssertNil(result2)
    }

    func testShift() {
        var dict = ["a": 1, "b": 2, "c": 3]
        let _ = dict.shift()
        let targetCount = 2
        XCTAssertEqual(dict.count, targetCount)
    }

    func testSize() {
        testLength()
    }

    func testStore() {
        var dict = ["a": 1, "b": 2, "c": 3]
        dict.store("c", value: 4)
        let target = ["a": 1, "b": 2, "c": 4]
        XCTAssertEqual(dict, target)
        let value = dict.store("d", value: 5)
        let target2 = ["a": 1, "b": 2, "c": 4, "d": 5]
        XCTAssertEqual(dict, target2)
        XCTAssertEqual(value, 5)
    }

    func testUpdate() {
        testMerge()
    }

    func testKey() {
        let dict = ["a": 1, "b": 2, "c": 3, "d": 4]
        let key = dict.key(3)
        XCTAssertEqual(key, "c")
    }

    func testHasValue() {
        let dict = ["a": 1, "b": 2, "c": 3, "d": 4]
        let result1 = dict.hasValue(4)
        let result2 = dict.hasValue(10)
        XCTAssertTrue(result1)
        XCTAssertFalse(result2)
    }

    func testInvert() {
        let dict = ["a": 1, "b": 2, "c": 3]
        let result = dict.invert()
        let target = [1: "a", 2: "b", 3: "c"]
        XCTAssertEqual(result, target)
    }


}