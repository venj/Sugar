//
//  NSDictionary+JSON.swift
//  Sugar
//
//  Created by Venj on 15/11/1.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension NSDictionary {
    /// Convert a dictionary to JSON string.
    var JSONString: String? {
        get {
            guard let data = self.JSONData else { return nil }
            return String(data: data, encoding: String.Encoding.utf8)
        }
    }

    /// Convert a dictionary to JSON data.
    var JSONData: Data? {
        get {
            guard let data = try? JSONSerialization.data(withJSONObject: self, options: []) else { return nil }
            return data
        }
    }
}
