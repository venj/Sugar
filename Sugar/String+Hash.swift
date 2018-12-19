//
//  String+Hash.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/3.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation
#if os(Linux)
import COpenSSL
#else
import CommonCrypto
#endif

public enum HashAlgorithm : Int {
    case md4 = 0
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
    #if !os(Linux)
    case md2
    #endif
}

@available(iOS 7.0, OSX 10.9, *)
public extension String {

    #if !os(Linux)
    /// String's MD2 checksum.
    var md2: String {
        return calculateHashForAlgorithm(.md2)
    }
    #endif

    /// String's MD4 checksum.
    var md4: String {
        return calculateHashForAlgorithm(.md4)
    }

    /// String's MD5 checksum. 
    var md5: String {
        return calculateHashForAlgorithm(.md5)
    }

    /// String's SHA1 checksum.
    var sha1: String {
        return calculateHashForAlgorithm(.sha1)
    }

    /// String's SHA224 checksum.
    var sha224: String {
        return calculateHashForAlgorithm(.sha224)
    }

    /// String's SHA256 checksum.
    var sha256: String {
        return calculateHashForAlgorithm(.sha256)
    }

    /// String's SHA384 checksum.
    var sha384: String {
        return calculateHashForAlgorithm(.sha384)
    }

    /// String's SHA512 checksum.
    var sha512: String {
        return calculateHashForAlgorithm(.sha512)
    }

    /// String's HMAC-MD5 checksum.
    func hmacMD5(_ key: String) -> String {
        return calculateHashForAlgorithm(.md5, hmacKey: key)
    }

    /// String's HMAC-SHA1 checksum.
    func hmacSHA1(_ key: String) -> String {
        return calculateHashForAlgorithm(.sha1, hmacKey: key)
    }

    /// String's HMAC-SHA224 checksum.
    func hmacSHA224(_ key: String) -> String {
        return calculateHashForAlgorithm(.sha224, hmacKey: key)
    }

    /// String's HMAC-SHA256 checksum.
    func hmacSHA256(_ key: String) -> String {
        return calculateHashForAlgorithm(.sha256, hmacKey: key)
    }

    /// String's HMAC-SHA384 checksum.
    func hmacSHA384(_ key: String) -> String {
        return calculateHashForAlgorithm(.sha384, hmacKey: key)
    }

    /// String's HMAC-SHA512 checksum.
    func hmacSHA512(_ key: String) -> String {
        return calculateHashForAlgorithm(.sha512, hmacKey: key)
    }

    fileprivate func calculateHashForAlgorithm(_ algorithm: HashAlgorithm, hmacKey:String? = nil) -> String {
        #if !os(Linux)
        if hmacKey != nil && algorithm == .md2 { fatalError("MD2 is not HMAC compatible.") }
        #endif
        if hmacKey != nil && algorithm == .md4 { fatalError("MD4 is not HMAC compatible.") }
        let digestLength: Int
        #if os(Linux)
        var hmacAlgorithm: UnsafePointer<EVP_MD>
        #else
        let hmacAlgorithm: CCHmacAlgorithm
        #endif
        #if os(Linux)
        switch algorithm {
            case .MD4:
                digestLength = Int(MD4_DIGEST_LENGTH)
                hmacAlgorithm = nil // Silence compile warning
            case .MD5:
                digestLength = Int(MD5_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_md5()
            case .SHA1:
                digestLength = Int(SHA_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_sha1()
            case .SHA224:
                digestLength = Int(SHA224_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_sha224()
            case .SHA256:
                digestLength = Int(SHA256_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_sha256()
            case .SHA384:
                digestLength = Int(SHA384_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_sha384()
            case .SHA512:
                digestLength = Int(SHA512_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? nil : EVP_sha512()
        }
        #else
        switch algorithm {
            case .md2:
                digestLength = Int(CC_MD2_DIGEST_LENGTH)
                hmacAlgorithm = UInt32(0) // Silence compile warning
            case .md4:
                digestLength = Int(CC_MD4_DIGEST_LENGTH)
                hmacAlgorithm = UInt32(0) // Silence compile warning
            case .md5:
                digestLength = Int(CC_MD5_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgMD5)
            case .sha1:
                digestLength = Int(CC_SHA1_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgSHA1)
            case .sha224:
                digestLength = Int(CC_SHA224_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgSHA224)
            case .sha256:
                digestLength = Int(CC_SHA256_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgSHA256)
            case .sha384:
                digestLength = Int(CC_SHA384_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgSHA384)
            case .sha512:
                digestLength = Int(CC_SHA512_DIGEST_LENGTH)
                hmacAlgorithm = hmacKey == nil ? UInt32(0) : UInt32(kCCHmacAlgSHA512)
        }
        #endif
        var result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLength)
        defer { free(result) }
        let length = self.utf8.count
        if let key = hmacKey {
            let keyLength = key.utf8.count
            #if os(Linux)
                var resultLength: UInt32 = 0
                HMAC(hmacAlgorithm, key, Int32(keyLength), self, length, result, &resultLength);
            #else
                CCHmac(hmacAlgorithm, key, keyLength, self, length, result);
            #endif
        }
        else {
            #if os(Linux)
            switch algorithm {
                case .MD4: MD4(self, Int(length), result)
                case .MD5: MD5(self, Int(length), result)
                case .SHA1: SHA1(self, Int(length), result)
                case .SHA224: SHA224(self, Int(length), result)
                case .SHA256: SHA256(self, Int(length), result)
                case .SHA384: SHA384(self, Int(length), result)
                case .SHA512: SHA512(self, Int(length), result)
            }
            #else
            switch algorithm {
                case .md2: CC_MD2(self, UInt32(length), result)
                case .md4: CC_MD4(self, UInt32(length), result)
                case .md5: CC_MD5(self, UInt32(length), result)
                case .sha1: CC_SHA1(self, UInt32(length), result)
                case .sha224: CC_SHA224(self, UInt32(length), result)
                case .sha256: CC_SHA256(self, UInt32(length), result)
                case .sha384: CC_SHA384(self, UInt32(length), result)
                case .sha512: CC_SHA512(self, UInt32(length), result)
            }
            #endif
        }
        return (0..<digestLength).map {
        let v = result.advanced(by: $0).pointee
        #if os(Linux)
            let s = String(v, radix: 16, uppercase: true)
            return s.characters.count == 1 ? "0"+s : s
        #else
            return String(format: "%02X", arguments: [v])
        #endif
        }.reduce("", +)
    }
}
