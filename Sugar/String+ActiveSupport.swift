//
//  String+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    // position with negtive value is not implemented, yet.
    func at(position: Int) -> String {
        return self[position]
    }

    func at(index: Index) -> String {
        let end = index.advancedBy(1)
        let range = Range<Index>(start:index, end:end)
        return substringWithRange(range)
    }

    func at(range: Range<Int>) -> String {
        return self[range]
    }

    func at(range: Range<Index>) -> String {
        return self[range]
    }

    func at(pattern: String) -> String? {
        guard let range = match(pattern)?.range else { return nil }
        return self[range]
    }

    func exclude(subString: String) -> Bool {
        return !include(subString)
    }

    func first(length:Int) -> String {
        if length <= 0 { return "" }
        if length >= count { return self }
        else { return self[0..<length] }
    }

    func squish() -> String {
        var result = self
        result = result.strip().gsub("[[:space:]]+", replacement: " ")
        return result
    }

    mutating func squishInPlace() -> String {
        self = squish()
        return self
    }

}