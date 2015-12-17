//
//  NSString+MD5.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/3.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation
#if os(iOS)
import CommonCrypto_iOS
#elseif os(OSX)
import CommonCrypto_OSX
#elseif os(tvOS)
import CommonCrypto_tvOS
#elseif os(watchOS)
import CommonCrypto_watchOS
#elseif os(Linux)
import COpenSSL
#endif

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /// String's MD5 checksum. 
    var md5: String {
        #if os(Linux)
        let digestLength = Int(MD5_DIGEST_LENGTH)
        #else
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        #endif
        var result = UnsafeMutablePointer<UInt8>.alloc(digestLength)
        let length = self.utf8.count
        #if os(Linux)
        MD5(self, Int(length), result)
        #else
        CC_MD5(self, UInt32(length), result)
        #endif
        return (0..<digestLength).map {
            let v = result.advancedBy($0).memory
            #if os(Linux)
                let s = String(v, radix: 16, uppercase: true)
                return s.characters.count == 1 ? "0"+s : s
            #else
                return String(format: "%02X", arguments: [v])
            #endif
        }.reduce("", combine: +)
    }
}
