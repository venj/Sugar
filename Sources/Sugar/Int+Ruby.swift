//
//  Int+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/16.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

/**
Integer extensions that mimic Ruby core's Integer and Numeric classes.
 
**This extension may have serious overflow issue while used on 32-bit platform.**
 
32-bit compatibility issue will be fixed in future extension for `Int64` and will be resolved here too. 

*/
@available(iOS 7.0, OSX 10.9, *)
public extension Int {
    // ceil, chr, denominator, ord, numerator, rationalize, round, truncate, to_xxx
    /**
    Get absolute value of an integer.
    
    - returns: Absolute value of an integer.
    */
    func abs() -> Int {
        return self >= 0 ? self : -self
    }

    /**
     Go through a range of integers from a larger number to a small number, and execute a closure that accept current value as argument every time. 
     
     - parameter to: A smaller integer. 
     - parameter invocation: A closure that accept current index as argument.
    */
    func downTo(to: Int, _ invocation:((index: Int) -> Void)) {
        if to >= self {
            invocation(index: self)
        }
        else {
            for var i = self; i >= to; --i {
                invocation(index: i)
            }
        }
    }
    /**
     Calculate great common devisor (GCD) of current integer and another integer.
     
     - parameter other: An integer. 
     - returns: GCD of current integer and another integer.
    */
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

    /**
     Calculate GCD and LCM (least common multiple) of current integer and another integer. 
     
     - parameter other: An integer.
     - returns: A tuple that contains the GCD and LCM of current integer and another integer.
    */
    func gcdlcm(other: Int) -> (gcd: Int, lcm: Int) {
        return (gcd: gcd(other), lcm: lcm(other))
    }

    /**
     Calculate least common multiple (LCM) of current integer and another integer.

     - parameter other: An integer.
     - returns: LCM of current integer and another integer.
     */
    func lcm(other: Int) -> Int {
        return self * other / gcd(other)
    }

    /**
     Examine whether current value is a even number. 
     
     - returns: Returns `true` of current value is even.
    */
    func isEven() -> Bool {
        return self % 2 == 0
    }

    /**
     Examine whether current value is a odd number.

     - returns: Returns `true` of current value is odd.
     */
    func isOdd() -> Bool {
        return !isEven()
    }

    /**
     Get the next integer that is larger than current integer. 
     
     - returns: An integer next to current integer.
    */
    func next() -> Int {
        return self + 1
    }

    /**
     Get the previous integer that is smaller than current integer.

     - returns: An integer previous to current integer.
     */
    func pred() -> Int {
        return self - 1
    }

    /**
     Alias for `next` method.
    */
    func succ() -> Int {
        return next()
    }

    /**
     Execute a closure for multiple times. 
     
     - parameter invocation: A closure accept current index as argument.
    */
    func times(invocation: ((index: Int) -> Void)) {
        for var i = 0; i < self; ++i {
            invocation(index: i)
        }
    }

    /**
     Go through a range of integers from a small number to a larger number, and execute a closure that accept current value as argument every time.

     - parameter to: A larger integer.
     - parameter invocation: A closure that accept current index as argument.
     */
    func upTo(to: Int, _ invocation:((index: Int) -> Void)) {
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


