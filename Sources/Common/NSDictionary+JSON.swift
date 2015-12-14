//
//  NSDictionary+JSON.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/1.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension NSDictionary {
    /// Convert a dictionary to JSON string.
    var JSONString: String? {
        get {
            guard let data = self.JSONData else { return nil }
            return String(data: data, encoding: NSUTF8StringEncoding)
        }
    }

    /// Convert a dictionary to JSON data.
    var JSONData: NSData? {
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self, options: []) else { return nil }
        return data
    }
}
