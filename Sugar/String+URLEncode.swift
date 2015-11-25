//
//  NSString+URLEncode.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /// Encode all the characters that are not rfc3986 reserved. Not very useful. Considering a more effective way.
    var percentEncodedString: String {
        get {
            let rfc3986ReservedCharacterSet = NSCharacterSet(charactersInString: " !*'();:@&=+$,/?%#[]") // Space char is included
            guard let str = self.stringByAddingPercentEncodingWithAllowedCharacters(rfc3986ReservedCharacterSet.invertedSet) else { return self }
            return str
        }
    }

    /// Decode percent encoded string. 
    var decodedPercentEncodingString: String {
        get {
            let str = self.stringByReplacingOccurrencesOfString("+", withString: " ")
            guard let s = str.stringByRemovingPercentEncoding else { return self }
            return s
        }
    }
}
