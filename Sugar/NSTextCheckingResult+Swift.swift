//
//  NSTextCheckingResult+Swift.swift
//  Sugar Example
//
//  Created by 朱 文杰 on 15/11/14.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension NSTextCheckingResult {
    subscript(index: Int) -> NSRange {
        return self.rangeAtIndex(index)
    }
}
