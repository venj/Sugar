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
    var JSONString: String? {
        get {
            guard let data = self.JSONData else { return nil }
            return String(data: data, encoding: NSUTF8StringEncoding)
        }
    }

    var JSONData: NSData? {
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self, options: []) else { return nil }
        return data
    }
}
