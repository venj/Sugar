//
//  NSData+Base64.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension NSData {
    /**
     Decoded data from a base64 encoded string. 
     
     - returns: Data or `nil`
    */
    class func dataWithBase64EncodedString(string: String) -> NSData? {
        return self.init(base64EncodedString: string, options: [])
    }

    /**
     Convert a data object into base64 encoded string.
    */
    func base64EncodedString() -> String {
        return self.base64EncodedStringWithOptions([])
    }
}