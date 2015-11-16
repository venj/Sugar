//
//  Int+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

infix operator ** { associativity left precedence 160 }
@available(iOS 7.0, OSX 10.9, *)
public func **(lhs: Int, rhs: Int) -> Int {
    var result = 1
    rhs.times { _ in result *= lhs }
    return result
}

@available(iOS 7.0, OSX 10.9, *)
public extension Int {
    // ceil, chr, denominator, ord, numerator, rationalize, round, truncate, to_xxx
    func abs() -> Int {
        return self >= 0 ? self : -self
    }

    func downTo(to: Int, invocation:((index: Int) -> Void)) {
        if to >= self {
            invocation(index: self)
        }
        else {
            for var i = self; i >= to; --i {
                invocation(index: i)
            }
        }
    }

    func gcd(other: Int) -> Int {
        var a = self, b = other
        var c = self % other
        while c != 0 {
            a = b
            b = c
            c = a % b
        }
        return b
    }

    func gcdlcm(other: Int) -> (gcd: Int, lcm: Int) {
        return (gcd: gcd(other), lcm: lcm(other))
    }

    func lcm(other: Int) -> Int {
        return self * other / gcd(other)
    }

    func isEven() -> Bool {
        return self % 2 == 0
    }

    func isOdd() -> Bool {
        return !isEven()
    }

    func next() -> Int {
        return self + 1
    }

    func pred() -> Int {
        return self - 1
    }

    func succ() -> Int {
        return next()
    }

    func times(invocation: ((index: Int) -> Void)) {
        for var i = 0; i < self; ++i {
            invocation(index: i)
        }
    }

    func upTo(to: Int, invocation:((index: Int) -> Void)) {
        if to <= self {
            invocation(index: self)
        }
        else {
            for var i = self; i <= to; ++i {
                invocation(index: i)
            }
        }
    }
}


