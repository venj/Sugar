//
//  NSString+Path.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 9.0, OSX 10.11, *)
public extension String {
    // mimic the behavior NSString's method with the same name. Not cross-platform.
    func stringByAppendingPathComponents(components: [String]) -> String {
        let componentsCount = components.count
        var str = self
        for var i = 0; i < componentsCount - 1; i++ {
            str = str + "/" + components[i]
        }
        return str
    }

    func stringByAppendingPathComponent(component: String) -> String {
        return self.stringByAppendingPathComponents([component])
    }

    // This method returns a str that could create a valid URL
    func URLStringByAppendingPathComponents(components: [String]) -> String? {
        guard var url = NSURL(string: self) else { return nil }
        for component in components {
            url = url.URLByAppendingPathComponent(component)
        }
        return url.absoluteString
    }

    func URLStringByAppendingPathComponent(component: String) -> String? {
        return self.URLStringByAppendingPathComponents([component])
    }

    var pathComponents: [String]? {
        guard let url = NSURL(string: self) else { return nil }
        return url.pathComponents
    }

    var lastPathComponent: String {
        guard let url = NSURL(string: self) else { return "" }
        guard let components = url.pathComponents else { return "" }
        return components.last!
    }
}
