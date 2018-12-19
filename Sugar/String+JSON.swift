//
//  String+JSON.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//
#if !os(Linux)

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /**
     Convert a JSON string to a JSONObject.
     
     - parameter encoding: String encoding for the JSON string. 
     - returns: JSON object (typically a dictionary or an array) or `nil` if conversion failed.
    */
    func JSONObject(_ encoding: String.Encoding = String.Encoding.utf8) -> AnyObject? {
        guard let data = self.data(using: encoding) else { return nil }
        guard let JSON = try? JSONSerialization.jsonObject(with: data, options:[]) else { return nil }
        return JSON as AnyObject?
    }
}

#endif
