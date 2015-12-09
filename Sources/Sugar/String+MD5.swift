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
import Glibc
#endif

// via https://github.com/mnbayan/StringHash

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /// String's MD5 checksum. 
    var md5: String {
        #if os(Linux)
        let digestLength = Int(MD5_DIGEST_LENGTH)
        #else
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        #endif
        var result: [UInt8] = [UInt8(0)] * digestLength
        let length = strlen(self)
        #if os(Linux)
        MD5(self, Int(length), &result)
        #else
        CC_MD5(self, UInt32(length), &result)
        #endif
        let hash = result.map {
            String($0, radix: 16, uppercase: true)
        }.reduce("", combine: +)
        return hash
    }
}
