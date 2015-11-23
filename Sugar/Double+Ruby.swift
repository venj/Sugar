//
//  DOuble+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)
/**
Calculate power of a double value.

- parameter lhs: Can be a minus number.
- parameter rhs: Can not be minus for now, and should be an integer.
- returns: Power of two numbers.
*/
public func **(lhs: Double, rhs: Int) -> Double {
    var result = 1.0
    rhs.times { _ in result *= lhs }
    return result
}

@available(iOS 7.0, OSX 10.9, *)
public extension Double {
    /**
     Get the absolute value of a `Double` value.
     */
    func abs() -> Double {
        return self >= 0 ? self : -self
    }
}

