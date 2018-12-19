//
//  Operators+General.swift
//  Sugar
//
//  Created by 朱文杰 on 16/1/4.
//  Copyright © 2016年 朱文杰. All rights reserved.
//

//MARK: - Plus operators
/**
 Add `Int` to `String` creates a `String`.

 - parameter lhs: Left hand side operand is a `String`.
 - parameter rhs: Right hand side operand is an `Int`.
 - returns: A `String`.
*/
infix operator +!: PlusExclimationPrecedence
precedencegroup PlusExclimationPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}

@available(iOS 7.0, OSX 10.9, *)
public func +!(lhs: String, rhs: Int) -> String {
    return lhs + String(rhs)
}

/**
 Add `String` to `Int` creates a `Int`. This operator first convert String to Int, then, add together.
 
 If `lhs` string is not convertable to `Int`, `rhs` side is returned.

 - parameter lhs: Left hand side operand is an `Int`.
 - parameter rhs: Right hand side operand is a `String`.
 - returns: An `Int`.
*/
@available(iOS 7.0, OSX 10.9, *)
public func +!(lhs: Int, rhs: String) -> Int {
    guard let i = Int(rhs) else { return lhs }
    return lhs + i
}

/**
 Add `Double` to `Int` creates a `Double`.

 - parameter lhs: Left hand side operand is an `Int`.
 - parameter rhs: Right hand side operand is a `Double`.
 - returns: A `Double`.
*/
@available(iOS 7.0, OSX 10.9, *)
public func +!(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) + rhs
}

/**
 Add `Int` to `Double` creates a `Double`.

 - parameter lhs: Left hand side operand is a `Double`.
 - parameter rhs: Right hand side operand is an `Int`.
 - returns: A `Double`.
*/
@available(iOS 7.0, OSX 10.9, *)
public func +!(lhs: Double, rhs: Int) -> Double {
    return lhs + Double(rhs)
}
