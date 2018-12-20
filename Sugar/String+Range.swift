//
//  String+Range.swift
//  Sugar
//
//  Created by Venj on 15/11/4.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension String {
    /**
     Create a valid `Range<Index>` object of the string by an `NSRange` value. If `NSRange` is not valid, the conversion will cause a fatal error. (The fatal will be changed to a throw in future.)
     
     - parameter range: An `NSRange` value. 
     - returns: A `Range<Index>` reflect the `NSRange`
    */
    func range(fromNSRange range : NSRange) -> Range<String.Index>? {
        return Range(range, in: self)
    }

    /**
     Get sub string using an `NSRange` value. 
     
     - parameter nsRange: An `NSRange` value.
     - returns: Sub string at `NSRange`.
    */
    func substring(withNSRange nsRange: NSRange) -> String? {
        guard let range = range(fromNSRange: nsRange) else { return nil }
        return String(self[range])
    }
}

#if os(Linux)
extension String {
    func substring(with range: Range<String.Index>) -> String {
        return self[range]
    }
}
#endif
