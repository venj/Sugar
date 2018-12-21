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
     
     - returns: A `Range<Index>` object or `nil`.
    */

    func range(in string: String) -> Range<String.Index>? {
        return Range(self, in: string)
    }

    /**
     Create a `Range<Int>` object from `NSRange` value.

     - returns: A `Range<Int>` object.
     */
    func range() -> Range<Int> {
        let startIndex = location
        let endIndex = startIndex.advanced(by: length)
        return Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
}
