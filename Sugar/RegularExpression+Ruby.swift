//
//  RegularExpression+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

//TODO: Regex options are not applicable here, add later
/**
Determine whether a string matches a regular expression pattern.
*/
infix operator =~ { associativity none precedence 130 }
@available(iOS 7.0, OSX 10.9, *)
public func =~(lhs: String, rhs: String) -> Int? {
    guard let regex = try? NSRegularExpression(pattern: rhs, options: []) else { return nil }
    guard let match = regex.firstMatchInString(lhs, options: [], range: NSRange(location: 0, length: lhs.characters.count)) else { return nil }
    return match.range.location
}

/**
Determine whether a string does not matches a regular expression pattern.
*/
infix operator !~ { associativity none precedence 130 }
@available(iOS 7.0, OSX 10.9, *)
// since swift does not have literal for regex, so not like ruby,
// here we always use rhs as regex pattern
public func !~(lhs: String, rhs: String) -> Bool {
    return (lhs =~ rhs) != nil ? false : true
}
