//
//  NSRange+Swift.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/12.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

public extension NSRange {
    /**
     Create a `Range<Index>` object from `NSRange` value.
     
     - returns: A `Range<Index>` object. 
    */
    func range() -> Range<Int> {
        let startIndex = location
        let endIndex = startIndex.advancedBy(length)
        return Range(start: startIndex, end: endIndex)
    }
}