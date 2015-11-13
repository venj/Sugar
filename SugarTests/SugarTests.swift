//
//  SugarTests.swift
//  SugarTests
//
//  Created by 朱文杰 on 15/11/11.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import XCTest
import Foundation
@testable import Sugar

class SugarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //MARK: - Tests for String+MD5.swift
    func testStringMD5() {
        let str = "Hello world."
        XCTAssertEqual(str.md5, "764569e58f53ea8b6404f6fa7fc0247f")
    }

    //MARK: - Tests for String+URLEncode.swift
    func testPercentEncodedString() {
        let str = "% /".percentEncodedString
        let encodedString = "%25%20%2F"
        XCTAssertEqual(str, encodedString)
    }

    //MARK: - Tests for String+Path.swift
    func testStringByAddingComponents() {
        let base = "//Base"
        let components = ["not:a-valid string for path./", "/git.pdf"]
        XCTAssertEqual(base.stringByAppendingPathComponents(components), "/Base/not:a-valid string for path./git.pdf")
        let component = "/git.pdf"
        XCTAssertEqual(base.stringByAppendingPathComponent(component), "/Base/git.pdf")
    }

    func testURLStringByAddingComponents() {
        let validBase = "//Base"
        let components = ["not:a-valid string for path.//", "/git.pdf"]
        XCTAssertEqual(validBase.URLStringByAppendingPathComponents(components), "//Base/not:a-valid%20string%20for%20path.///git.pdf")
        let invalidBase = ""
        XCTAssertNil(validBase.URLStringByAppendingPathComponents(components))
    }
    
}
