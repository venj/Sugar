//
//  Dictionary+JSON.swift
//  Sugar
//
//  Created by Venj on 15/11/1.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension Dictionary {
    /// Convert a dictionary to JSON string.
    var JSONString: String? {
        get {
            guard let data = self.JSONData else { return nil }
            return String(data: data, encoding: .utf8)
        }
    }

    /// Convert a dictionary to JSON data.
    var JSONData: Data? {
        get {
            return try? JSONSerialization.data(withJSONObject: self, options: [])
        }
    }
}
