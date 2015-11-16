//
//  Float+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)
public func **(lhs: Float, rhs: Int) -> Float {
    var result: Float = 1.0
    rhs.times { _ in result *= lhs }
    return result
}

@available(iOS 7.0, OSX 10.9, *)
public extension Float {
    func abs() -> Float {
        return self >= 0 ? self : -self
    }
}