//
//  NSString+JSON.swift
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
    func JSONObject(encoding: NSStringEncoding = NSUTF8StringEncoding) -> AnyObject? {
        guard let data = self.dataUsingEncoding(encoding) else { return nil }
        guard let JSON = try? NSJSONSerialization.JSONObjectWithData(data, options:[]) else { return nil }
        return JSON
    }
}

#endif
