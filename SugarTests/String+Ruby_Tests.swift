//
//  String+Ruby_Tests.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/20.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class StringRubyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // Test Operators

    func testDoublePercentOperator() {
        let str = "Int: %ld Float: %.2f, String: %@" %% [9999, 3.1415926, "hello world."]
        let target = "Int: 9999 Float: 3.14, String: hello world."
        XCTAssertEqual(str, target)
    }

    func testMultiplyOperator() {
        let str = "hello" * 3
        let target = "hellohellohello"
        XCTAssertEqual(str, target)
    }

    func testDoubleLTOperator() {
        let str1 = "hello " << "world"
        let target1 = "hello world"
        let str2 = "1 + 1 = " << 2
        let target2 = "1 + 1 = 2"
        XCTAssertEqual(str1, target1)
        XCTAssertEqual(str2, target2)
    }

    func testUUIDString() {
        let uuid1 = String.UUIDString()
        let uuid2 = String.UUIDString()
        XCTAssertNotEqual(uuid1, uuid2)
    }

    func testSubscriptInt() {
        let original = "Hello world"
        let part1 = original[0]
        let part2 = original[5]
        let part3 = original[-1]
        XCTAssertEqual(part1, "H")
        XCTAssertEqual(part2, " ")
        XCTAssertEqual(part3, "d")
    }

    func testSubscriptIntRange() {
        let original = "Hello world"
        let part1 = original[0...5]
        let part2 = original[1..<4]
        XCTAssertEqual(part1, "Hello ")
        XCTAssertEqual(part2, "ell")
    }

    func testSubscriptRangeIndex() {
        let original = "Hello world"
        let range = original.startIndex ..< original.startIndex.advancedBy(3)
        let part = original[range]
        XCTAssertEqual(part, "Hel")
    }

    func testSubscriptNSRange() {
        let original = "Hello world"
        let nsrange = NSRange(location: 1, length: 3)
        let part = original[nsrange]
        XCTAssertEqual(part, "ell")
    }

    func testCapitalize() {
        let original = "the arrow"
        XCTAssertEqual(original.capitalize(), "The Arrow")
    }


    func testCaseCmp() {
        let result1 = "abc".casecmp("Abc") == 0
        let result2 = "abcd".casecmp("Abc") == 1
        let result3 = "abc".casecmp("Abd") == -1
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
        XCTAssertTrue(result3)
    }

    func testCenter() {
        let original = "abc"
        let center1 = original.center(10)
        let center2 = original.center(10, padString: "-")
        let center3 = original.center(5, padString: "x*x")
        let center4 = original.center(7, padString: "x*x")
        XCTAssertEqual(center1, "   abc    ")
        XCTAssertEqual(center2, "---abc----")
        XCTAssertEqual(center3, "xabcx")
        XCTAssertEqual(center4, "x*abcx*")
    }

    func testChomp() {
        let result1 = "hello".chomp()
        let result2 = "hello\n\n\n".chomp()
        let result3 = "hello\r\n".chomp()
        let result4 = "hello\n\r".chomp()
        let result5 = "hello\r".chomp()
        let result6 = "hello \n there".chomp()
        let result7 = "hello".chomp("llo")
        let result8 = "hello\r\n".chomp("")
        let result9 = "hello\r\n\r\n".chomp("\r\n")
        let result10 = "llollollollohellollllollollo".chomp("llo")

        XCTAssertEqual(result1, "hello")
        XCTAssertEqual(result2, "hello")
        XCTAssertEqual(result3, "hello")
        XCTAssertEqual(result4, "hello\n")
        XCTAssertEqual(result5, "hello")
        XCTAssertEqual(result6, "hello \n there")
        XCTAssertEqual(result7, "he")
        XCTAssertEqual(result8, "hello\r\n")
        XCTAssertEqual(result9, "hello")
        XCTAssertEqual(result10, "llollollollohelloll")
    }

    func testChop() {
        let str = "Hello"
        XCTAssertEqual(str.chop(), "Hell")
    }

    func testChopInPlace() {
        var str = "Hello"
        str.chopInPlace()
        XCTAssertEqual(str, "Hell")
    }

    func testClear() {
        var str = "Some String"
        str.clear()
        XCTAssertEqual(str, "")
    }

    func testConcat() {
        let str1 = "hello ".concat("world")
        let target1 = "hello world"
        let str2 = "1 + 1 = ".concat(2)
        let target2 = "1 + 1 = 2"
        XCTAssertEqual(str1, target1)
        XCTAssertEqual(str2, target2)
    }

    func testCount() {
        XCTAssertEqual("Hello".count, 5)
    }

    func testDelete() {
        let original = "hello"
        XCTAssertEqual(original.delete(["her", "rely"]), "hllo")
    }

    func testDeleteInPlace() {
        var original = "hello"
        original.deleteInPlace(["her", "rely"])
        XCTAssertEqual(original, "hllo")
    }

    func testDowncase() {
        let original = "hELlo, WOrlD."
        let downcased = "hello, world."
        XCTAssertEqual(original.downcase(), downcased)
    }

    func testDowncaseInPlace() {
        var original = "hELlo, WOrlD."
        original.downcaseInPlace()
        let downcased = "hello, world."
        XCTAssertEqual(original, downcased)
    }

    func testEachChar() {
        var result = ""
        "hello".eachChar {
            result += (String($0) + " ")
        }
        XCTAssertEqual(result, "h e l l o ")
    }

    func testEachLine() {
        let str = "Line 1\nLine 2\n\nLine 4"
        var numberOfLines = 0
        str.eachLine { _ in
            numberOfLines += 1
        }
        XCTAssertEqual(numberOfLines, 4)
    }

    func testEmpty() {
        XCTAssertTrue("".empty)
        XCTAssertFalse(" ".empty)
        XCTAssertFalse("Not empty".empty)
    }

    func testEncode() {
        let original = "中国"
        let utf16String = original.encode(NSUTF16StringEncoding)
        XCTAssertNotNil(utf16String)
    }

    func testEndWith() {
        let str = "Hello"
        XCTAssertTrue(str.endWith("lo"))
        XCTAssertFalse(str.endWith("lol"))
    }

    func testGsubNoInvocation() {
        let original = "hello daaaaaaark world."
        let replaced = original.gsub("da+rk", replacement: "beautiful")
        XCTAssertEqual(replaced, "hello beautiful world.")
    }

    func testGsubWithInvocation() {
        let original = "plaese, relaese, plaese!"
        var count = 0
        let replaced = original.gsub("ae") {
            count += 1
            let fetched = original[$0.range]
            return fetched.reverse()
        }

        XCTAssertEqual(count, 3)
        XCTAssertEqual(replaced, "please, release, please!")
    }

    func testInclude() {
        XCTAssertTrue("hello".include("hell"))
        XCTAssertFalse("hello".include("lol"))
    }

    func testIndex() {
        let original1 = "<a href=\"http:www.google.com\">Google</a><br><a href=\"#tag\">Tag</a>"
        let index1 = original1.index("a")
        let index2 = original1.index("a", isReverse:true)
        let index3 = original1.index("<.+>", isRegex: true, offset: 6) // reverse is not applicable
        XCTAssertEqual(index1, 1)
        XCTAssertEqual(index2, 64)
        XCTAssertEqual(index3, 36)
    }

    func testInsert() {
        var original = "Hello world"
        let result = original.insert(6, subString: "coding ")
        XCTAssertEqual(result, "Hello coding world")
    }

    func testLength() {
        XCTAssertEqual("hello".length, 5)
    }

    func testLines() {
        let str = "line 1\n\nline 3\nline 4\n\nline 6"
        let lines = str.lines()
        let target = ["line 1", "", "line 3", "line 4", "", "line 6"]
        let result = lines == target
        XCTAssertTrue(result)
    }

    func testLjust() {
        let str = "hello"
        let result = str.ljust(10)
        let target = "hello     "
        XCTAssertEqual(result, target)
    }

    func testLstrip() {
        let str = "    Hello   world     "
        let result = str.lstrip()
        let target = "Hello   world     "
        XCTAssertEqual(result, target)
    }

    func testLstripInPlace() {
        var str = "    Hello   world     "
        str.lstripInPlace()
        let target = "Hello   world     "
        XCTAssertEqual(str, target)
    }

    func testLastMatch() {
        let str = "hello"
        let match = str.lastMatch("l")
        let location = match!.range.location
        XCTAssertEqual(location, 3)
    }

    func testAllMatches() {
        let str = "hello"
        let matches = str.allMatches("l")
        XCTAssertEqual(matches?.count, 2)
    }

    func testMatch() {
        let str = "hello"
        let match = str.match("l")
        let location = match!.range.location
        XCTAssertEqual(location, 2)
    }

    func testPartition() {
        let str = "Halloween"
        let partition = str.partition("ll")
        let target = ["Ha", "ll", "oween"]
        let result = partition == target
        XCTAssertTrue(result)
    }

    func testPrepend() {
        let str = " world"
        let result = str.prepend("hello")
        let target = "hello world"
        XCTAssertEqual(result, target)
    }

    func testReplace() {
        var str = "hello"
        let result = str.replace("bello")
        XCTAssertEqual(result, "bello")
    }

    func testReverse() {
        let str = "lol"
        XCTAssertEqual(str.reverse(), "lol")
        let str1 = "pit"
        XCTAssertEqual(str1.reverse(), "tip")
    }

    func testReverseInPlace() {
        var str = "lol"
        str.reverseInPlace()
        XCTAssertEqual(str, "lol")
        var str1 = "pit"
        str1.reverseInPlace()
        XCTAssertEqual(str1, "tip")
    }

    func testRindex() {
        let str = "hello"
        let result = str.rindex("l")
        XCTAssertEqual(result, 3)
    }
    
    func testRjust() {
        let str = "hello"
        let result1 = str.rjust(10)
        let result2 = str.rjust(10, padString: "*-")
        XCTAssertEqual(result1, "     hello")
        XCTAssertEqual(result2, "*-*-*hello")
    }
    
    func testRstrip() {
        let str = "  hello    world   "
        let result = str.rstrip()
        let target = "  hello    world"
        XCTAssertEqual(result, target)
    }
    
    func testRstripInPlace() {
        var str = "  hello    world   "
        str.rstripInPlace()
        let target = "  hello    world"
        XCTAssertEqual(str, target)
    }

    func testScan() {
        let str = "h-e-l-l-o w-o-r-l-d"
        var count = 0
        str.scan("-") { _ in
            count += 1
        }
        XCTAssertEqual(count, 8)
    }
    
    func testSize() {
        let str = "hello"
        XCTAssertEqual(str.size, 5)
    }
    
    func testSplit() {
        let str = "hello \t world"
        let chars = str.split("")
        let words = str.split("\\s+", isRegex: true)
        let nochange = str.split()
        XCTAssertEqual(chars.count, 13)
        XCTAssertEqual(words.count, 2)
        XCTAssertEqual(nochange, [str])
    }

    func testSqueeze() {
        let str = "  hello   world   "
        let result = str.squeeze()
        let target = " hello world "
        XCTAssertEqual(result, target)
    }
    
    func testSqueezeInPlace() {
        var str = "  hello   world   "
        str.squeezeInPlace()
        let target = " hello world "
        XCTAssertEqual(str, target)
    }
    
    func testSub() {
        let str = "hello world"
        let result = str.sub("l", replacement: "1")
        let target = "he1lo world"
        XCTAssertEqual(result, target)
    }
    
    func testSubWithRegex() {
        let str = "<a href=\"http://google.com\">Google</a>"
        let result = str.sub("<[^>]+?>", replacement: "")
        let target = "Google</a>"
        XCTAssertEqual(result, target)
    }
    
    func testUpcase() {
        let str = "hElLo wOrLd"
        let result = str.upcase()
        let target = "HELLO WORLD"
        XCTAssertEqual(result, target)
    }
    
    func testUpcaseInPlace() {
        var str = "hElLo wOrLd"
        str.upcaseInPlace()
        let target = "HELLO WORLD"
        XCTAssertEqual(str, target)
    }
    
    func testValidEncoding() {
        let str1 = "中国"
        let result1 = str1.validEncoding(NSASCIIStringEncoding)
        let result2 = str1.validEncoding(NSUTF16StringEncoding)
        let str2 = "😊"
        let result3 = str2.validEncoding(NSUTF8StringEncoding)
        XCTAssertFalse(result1)
        XCTAssertTrue(result2)
        XCTAssertTrue(result3)
    }

    func testHasPrefix() {
        let str = "开始➡️：This is a string has 混合 codings. Exposé! 😄~ 呜哈哈."
        let prefix = "开始➡️：This"
        self.measureBlock {
            // Put the code you want to measure the time of here.
            10000.times { _ in str.hasPrefix(prefix) }
        }
    }
    #if os(Linux)
    func testHasPrefix2() {
        let str = "开始➡️：This is a string has 混合 codings. Exposé! 😄~ 呜哈哈."
        let prefix = "开始➡️：This"
        self.measureBlock {
            // Put the code you want to measure the time of here.
            10000.times { _ in str.hasPrefix2(prefix) }
        }
    }
    #endif
}