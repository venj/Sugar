//
//  NSData+Base64.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

#if !os(Linux)

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension Data {
    /**
     Decoded data from a base64 encoded string. 
     
     - returns: Data or `nil`
    */
    init?(withBase64EncodedString string: String) {
        self.init(base64Encoded: string, options: [])
    }

    /**
     Convert a data object into base64 encoded string.
    */
    func base64EncodedString() -> String {
        return self.base64EncodedString(options: [])
    }
}

#endif
