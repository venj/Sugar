//
//  Operators+Ruby.swift
//  Sugar
//
//  Created by Venj on 15/11/25.
//  Copyright © 2015年 Venj. All rights reserved.
//

import Foundation

#if !os(Linux)
//MARK: - String Operators
/**
`%%` is an operator that mimic the behavior of Ruby's `%` operator. `%%` is used
as a shortcut for `String`'s `format:arguments:` method. Like:

"%@ has %ld unread email messages." %% ["Tom", 10]

This will produce string:

Tom has 10 unread email messages.

Since Swift have very powerful String interpolation ability, this method not very useful. Not like Ruby's `%`, named arguments list is not implemented.

- parameter lhs: Left hand side operand is a format string.
- parameter rhs: Right hand side operand is an array containing `CVarArgType` arguments.
- returns: The formatted string.
*/

infix operator %%: DoublePercentPrecedence
precedencegroup DoublePercentPrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}

@available(iOS 8.0, OSX 10.10, *)
public func %%(lhs: String, rhs: [CVarArg]) -> String{
    return String(format: lhs, arguments: rhs)
}

#endif

/**
 `*` will produce a string that repeat the original string for several times.

 "hello" * 3

 This will produce string:

 "hellohellohello"

 - parameter lhs: Left hand side operand is the original string
 - parameter rhs: Right hand side operand is an `Int` that indicate how many times that should be repeated.
 - returns: The repeated string.
 */
@available(iOS 8.0, OSX 10.10, *)
public func *(lhs: String, rhs:Int) -> String {
    if rhs < 0 {
        fatalError("String can not multiply by negtive number.")
    }
    var result = ""
    for _ in 0..<rhs{
        result += lhs
    }
    return result
}

// This operator is different from Ruby's implementation.
// Since manipulate with unicode point is difficult, we
// are not convert Int to char while using this operator
// like ruby did.
/**
`<<` operator will concat the right hand side operand in to left hand side string.
But unlike Ruby, when right hand size operand is `Int`, this will not convert it
to Unicode charactor, but convert the `Int` to `String` and concat it to the left
hand size string.

- parameter lhs: The original string
- parameter rhs: Any type of object that `String` initializer can handle.
- returns: A string with left hand side operand and right hand side operand
*/
@available(iOS 8.0, OSX 10.10, *)
public func <<<T>(lhs: String, rhs: T) -> String {
    return lhs + String(describing: rhs)
}

//MARK: - Number Type Operator
infix operator **: DoubleAsteriskPrecedence
precedencegroup DoubleAsteriskPrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}
@available(iOS 8.0, OSX 10.10, *)
//TODO: minus rhs not implemented
/**
Calculate power of two integers.

- parameter lhs: Can be a minus number.
- parameter rhs: Can not be minus for now.
- returns: Power of two numbers.
*/
public func **(lhs: Int, rhs: Int) -> Int {
    var result = 1
    rhs.times { _ in result *= lhs }
    return result
}

/**
 Calculate power of two 64-bit integers.

 - parameter lhs: Can be a minus number.
 - parameter rhs: Can not be minus for now.
 - returns: Power of two numbers.
 */
public func **(lhs: Int64, rhs: Int64) -> Int64 {
    var result = Int64(1)
    rhs.times { _ in result *= lhs }
    return result
}

/**
 Calculate power of a double value.

 - parameter lhs: Can be a minus number.
 - parameter rhs: Can not be minus for now, and should be an integer.
 - returns: Power of two numbers.
 */
@available(iOS 8.0, OSX 10.10, *)
public func **(lhs: Double, rhs: Int) -> Double {
    var result = 1.0
    rhs.times { _ in result *= lhs }
    return result
}

/**
 Calculate power of a float value.

 - parameter lhs: Can be a minus number.
 - parameter rhs: Can not be minus for now, and should be an integer.
 - returns: Power of two numbers.
 */
@available(iOS 8.0, OSX 10.10, *)
public func **(lhs: Float, rhs: Int) -> Float {
    var result: Float = 1.0
    rhs.times { _ in result *= lhs }
    return result
}

//MARK: - Array Operator
/**
Array multiply an integer.

- parameter lhs: An array.
- parameter rhs: An integer.
- returns: A new array with all `lhs` elements repeated for `rhs` number of times.
*/
@available(iOS 8.0, OSX 10.10, *)
func *<Element>(lhs: Array<Element>, rhs: Int) -> [Element] {
    var result: [Element] = []
    rhs.times { (index) -> Void in
        result.append(contentsOf: lhs)
    }
    return result
}

/**
 Sum of two arrays.

 - parameter lhs: An array.
 - parameter rhs: Another array.
 - returns: A new array with `lhs` array and `rhs` array concatenated together.
 */
@available(iOS 8.0, OSX 10.10, *)
func +<Element>(lhs: [Element], rhs: [Element]) -> [Element] {
    var result: [Element] = lhs
    result.append(contentsOf: rhs)
    return result
}

// Anyway to implement & or - or | ?
/**
Concat an element into an existing array.

- parameter lhs: An array of elements.
- parameter rhs: An element.
- returns: A new array with all the elements from the original array and another element.
*/
@available(iOS 8.0, OSX 10.10, *)
func <<<Element>(lhs:[Element], rhs: Element) -> [Element] {
    var result: [Element] = lhs
    result.append(rhs)
    return result
}

/**
 Concat an array into an existing array.

 - parameter lhs: An array of elements.
 - parameter rhs: Another array.
 - returns: A new array with all the elements from the original array and another array.
 */
@available(iOS 8.0, OSX 10.10, *)
func <<<Element>(lhs:[Element], rhs: [Element]) -> [Element] {
    var result: [Element] = lhs
    result.append(contentsOf: rhs)
    return result
}

//MARK: - Spaceship Operator
/**
Spaceship operater for `Comparable` protocal.
*/
infix operator <=>: ShipPrecedence
precedencegroup ShipPrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}
@available(iOS 8.0, OSX 10.10, *)
public func <=> <T: Comparable>(lhs: T, rhs: T) -> Int {
    if lhs > rhs { return 1 }
    else if lhs == rhs { return 0 }
    else { return -1 }
}

//MARK: - NSDate Operator
/**
 Compare two `NSDate`. Earlier date is smaller.
*/
@available(iOS 8.0, OSX 10.10, *)
public func <(lhs: Date, rhs: Date) -> Bool {
    let lhsTimeStamp = lhs.timeIntervalSince1970
    let rhsTimeStamp = rhs.timeIntervalSince1970
    return (rhsTimeStamp - lhsTimeStamp) > 0
}

//MARK: - Regular Expression Operator
//TODO: Regex options are not applicable here, add later
/**
Determine whether a string matches a regular expression pattern.
*/
infix operator =~: RegexMatchPrecedence
precedencegroup RegexMatchPrecedence {
    associativity: left
    higherThan: ComparisonPrecedence
}
@available(iOS 8.0, OSX 10.10, *)
public func =~(lhs: String, rhs: String) -> Int? {
    guard let regex = try? NSRegularExpression(pattern: rhs, options: []) else { return nil }
    guard let match = regex.firstMatch(in: lhs, options: [], range: NSRange(location: 0, length: lhs.count)) else { return nil }
    return match.range.location
}

/**
Determine whether a string does not matches a regular expression pattern.
*/
infix operator !~: RegexMatchPrecedence
@available(iOS 8.0, OSX 10.10, *)
// since swift does not have literal for regex, so not like ruby,
// here we always use rhs as regex pattern
public func !~(lhs: String, rhs: String) -> Bool {
    return (lhs =~ rhs) != nil ? false : true
}
