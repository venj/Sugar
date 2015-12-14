//
//  Float+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//
/**
Ruby core flavored extension for `Double`.
*/
@available(iOS 7.0, OSX 10.9, *)
public extension Float {
    /**
     Get the absolute value of a `Float` value.
     */
    func abs() -> Float {
        return self >= 0 ? self : -self
    }
}