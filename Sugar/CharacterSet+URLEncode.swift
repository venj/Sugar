//
//  CharacterSet+URLEncode.swift
//  Sugar
//
//  Created by Venj on 16/5/18.
//  Copyright © 2016年 Venj. All rights reserved.
//

import Foundation

@available(iOS 8.0, OSX 10.10, *)
extension CharacterSet {
    /**
     Get URL encode safe characterset.

     - returns: URL encode safe characters.
     */
    static var formURLEncodeSafeCharacterSet: CharacterSet {
        get {
            var result = CharacterSet.alphanumerics
            result.insert(charactersIn: "-_.!~*'()")
            return result
        }
    }
}
