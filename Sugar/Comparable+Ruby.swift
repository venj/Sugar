//
//  Comparable+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

/**
Ruby core flavored extension for `Comparable` protocal.
*/
@available(iOS 7.0, OSX 10.9, *)
public extension Comparable {
    // not like ruby, this method also works while left > right
    /**
    Determine whether current object is between two other object. Objects should comform to `Comparable` protocal. 
    
    - parameter left: One comparable object. 
    - parameter right: Another comparable object. 
    - returns: If current object is between `left` and `right`, return `true`; otherwise, return `false`.
    */
    func isBetween(left: Self, _ right: Self) -> Bool {
        return left < right ? (left <= self && self <= right) : (left >= self && self >= right)
    }
}
