//
//  String+Range.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/4.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /**
     Create a valid `Range<Index>` object of the string by an `NSRange` value. If `NSRange` is not valid, the conversion will cause a fatal error. (The fatal will be changed to a throw in future.)
     
     - parameter range: An `NSRange` value. 
     - returns: A `Range<Index>` reflect the `NSRange`
    */
    func rangeFromNSRange(range : NSRange) -> Range<String.Index> {
        let from16 = utf16.startIndex.advancedBy(range.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(range.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
                return from ..< to
        }
        fatalError("Range conversion error")
    }

    /**
     Get sub string using an `NSRange` value. 
     
     - parameter nsRange: An `NSRange` value.
     - returns: Sub string at `NSRange`.
    */
    func substringWithNSRange(nsRange: NSRange) -> String {
        return self.substringWithRange(rangeFromNSRange(nsRange))
    }
}
