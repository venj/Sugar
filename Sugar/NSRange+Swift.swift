//
//  NSRange+Swift.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/12.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

public extension NSRange {
    func range() -> Range<Int> {
        let startIndex = location
        let endIndex = startIndex.advancedBy(length)
        return Range(start: startIndex, end: endIndex)
    }
}