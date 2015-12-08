//
//  NSTextCheckingResult+Swift.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/14.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

/**
 NSTextCheckingResult extension for easy manipulation.
*/
@available(iOS 7.0, OSX 10.9, *)
public extension NSTextCheckingResult {
    /**
     Subscript using an integer index to fetch a matched range at certain index.

     - parameter index: Integer index associated to a matched range.
     - returns: An `NSRange` value for a matched sub string.
    */
    subscript(index: Int) -> NSRange {
        return self.rangeAtIndex(index)
    }
}
