//
//  NSRange+Swift.swift
//  Sugar Example
//
//  Created by Venj on 15/11/12.
//  Copyright © 2015年 Venj. All rights reserved.
//

import Foundation

public extension NSRange {
    /**
     Create a `Range<Index>` object from `NSRange` value.
     
     - returns: A `Range<Index>` object. 
    */

    func range() -> Range<Int> {
        let startIndex = location
        let endIndex = startIndex.advanced(by: length)
        return Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
}
