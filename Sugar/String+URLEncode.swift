//
//  NSString+URLEncode.swift
//  Sugar
//
//  Created by Venj on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

#if !os(Linux)

import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension String {
    /// Encode all the characters that are not rfc3986 reserved. Not very useful. Considering a more effective way.
    var percentEncodedString: String {
        get {
            let rfc3986ReservedCharacterSet = CharacterSet(charactersIn: " !*'();:@&=+$,/?%#[]") // Space char is included
            guard let str = self.addingPercentEncoding(withAllowedCharacters: rfc3986ReservedCharacterSet.inverted) else { return self }
            return str
        }
    }

    /// Decode percent encoded string. 
    var decodedPercentEncodingString: String {
        get {
            let str = self.replacingOccurrences(of: "+", with: " ")
            guard let s = str.removingPercentEncoding else { return self }
            return s
        }
    }
}

#endif
