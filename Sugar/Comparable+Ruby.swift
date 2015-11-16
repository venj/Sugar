//
//  Comparable+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//


infix operator <=> { associativity none precedence 130 }
@available(iOS 7.0, OSX 10.9, *)
public func <=> <T: Comparable>(lhs: T, rhs: T) -> Int {
    if lhs > rhs { return 1 }
    else if lhs == rhs { return 0 }
    else { return -1 }
}
