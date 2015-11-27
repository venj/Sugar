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
#endif

// via https://github.com/mnbayan/StringHash

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /// String's MD5 checksum. 
    var md5: String {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen);

        CC_MD5(str!, strLen, result);

        var hash = ""
        for i in 0 ..< digestLen {
            hash += String(format:"%02x", arguments:[result[i]])
        }
        result.destroy();

        return hash
    }
}
