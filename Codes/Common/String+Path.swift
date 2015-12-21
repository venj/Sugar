//
//  String+Path.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 9.0, OSX 10.11, *)
public extension String {
    /**
     Mimic the behavior NSString's method with the same name. Not cross-platform.
     
     - parameter components: Path components array.
     - returns: A url string contains specified path components.
    */
    func stringByAppendingPathComponents(components: [String]) -> String {
        let componentsCount = components.count
        var str = self
        for i in 0..<(componentsCount - 1) {
            str = str + "/" + components[i]
        }
        return str
    }

    /**
     Append a path component to a string.
     
     - parameter component: A path component. 
     - returns: A url string contains the specified path component.
    */
    func stringByAppendingPathComponent(component: String) -> String {
        return self.stringByAppendingPathComponents([component])
    }

    /**
     Basically the same to `stringByAppendingPathComponents`. There are two differences: 
    
     1. This method will percent encode path components. 
     2. This method will always return a string (or `nil` if current string is not a valid url string) which could create a valid `NSURL` object.
     
     - parameter components: Path components array.
     - returns: A valid url string contains specified path components or `nil`.
    */
    func URLStringByAppendingPathComponents(components: [String]) -> String? {
        var url = NSURL(string: self)
        for component in components {
            url = url?.URLByAppendingPathComponent(component)
        }
        return url?.absoluteString
    }

    /**
     Append a path component to a url string.

     - parameter component: A path component.
     - returns: A valid url string contains the specified path component.
     */
    func URLStringByAppendingPathComponent(component: String) -> String? {
        return self.URLStringByAppendingPathComponents([component])
    }

    /// Get path components from a valid url string. If current string is not a valid url string, `nil` will be returned.
    var pathComponents: [String]? {
        guard let url = NSURL(string: self) else { return nil }
        return url.pathComponents
    }

    /// Get last path component from a valid url string. If current string is not a valid url string, Empty string `""` will be returned.
    var lastPathComponent: String {
        guard let url = NSURL(string: self) else { return "" }
        guard let components = url.pathComponents else { return "" }
        return components.last!
    }
}
