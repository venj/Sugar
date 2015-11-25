//
//  DOuble+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//
/**
 Ruby core flavored extension for `Double`.
*/
@available(iOS 7.0, OSX 10.9, *)
public extension Double {
    /**
     Get the absolute value of a `Double` value.
     */
    func abs() -> Double {
        return self >= 0 ? self : -self
    }
}
 