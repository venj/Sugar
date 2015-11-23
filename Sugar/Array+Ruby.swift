//
//  Array+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/17.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)

/**
Array multiply an integer.

- parameter lhs: An array.
- parameter rhs: An integer.
- returns: A new array with all `lhs` elements repeated for `rhs` number of times.
*/
func *<Element>(lhs: Array<Element>, rhs: Int) -> [Element] {
    var result: [Element] = []
    rhs.times { (index) -> Void in
        result.appendContentsOf(lhs)
    }
    return result
}

/**
 Sum of two arrays.

 - parameter lhs: An array.
 - parameter rhs: Another array.
 - returns: A new array with `lhs` array and `rhs` array concatenated together.
 */
func +<Element>(lhs: [Element], rhs: [Element]) -> [Element] {
    var result: [Element] = lhs
    result.appendContentsOf(rhs)
    return result
}

// Anyway to implement & or - or | ?
/**
Concat an element into an existing array.

- parameter lhs: An array of elements. 
- parameter rhs: An element. 
- returns: A new array with all the elements from the original array and another element.
*/
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
func <<<Element>(lhs:[Element], rhs: [Element]) -> [Element] {
    var result: [Element] = lhs
    result.appendContentsOf(rhs)
    return result
}

@available(iOS 7.0, OSX 10.9, *)
public extension Array {
    /*
        any is not applicable to generic Array, implemeted in `Array where Element: Equatable`
        You can use the anyIf method if Element does not conform to Comparable:

            a.anyIf("b") { $0 == $1 }  // true, suppose: let a = ["a", "b", "c"]
    
        or simply:

            a.anyIf("b", ==)
    */
    /**
    Examine whether an array contains an element or not by an invocation thet returns a boolean value. 
    
    - parameter element: The element need to be find. 
    - parameter invocation: A closure that accept current element and the target element and return a boolean value. 
    - returns: Return `true` if the element is found.
    */
    func anyIf(element: Element, _ invocation: ((Element, Element) -> Bool)) -> Bool {
        for var i = 0; i < count; ++i {
            if invocation(element, self[i]) {
                return true
            }
        }
        return false
    }

    /**
     Get the element at the specified position. 
     
     - parameter position: The position in the array. The position can be minus. If minus, the position is count from the end of the array.
     - returns: An element at the specified position. If the position is out of bound, `nil` will be returned. 
    */
    func at(position: Int) -> Element? {
        if position >= 0 && position < count {
            return self[position]
        }
        else if position < 0 && count+position >= 0 {
            return self[count+position]
        }
        else {
            return nil
        }
    }

    // bsearch

    mutating func clear() {
        removeAll()
    }

    func collect<T>(invocation:(Element) -> T) -> [T] {
        return map(invocation)
    }

    // collect!, compact, compact! is not applicable

    // combination not implement
    func concat(arr: [Element]) -> [Element] {
        return self + arr
    }

    // endless cycle is not implemented to avoid misuse
    func cycle(cycles:Int, _ invocation:(Element) -> Void) {
        var index = 0
        while true {
            if index == count * cycles { break }
            invocation(self[index % count])
            ++index
        }
    }

    /*
    delete not applicable to generic array use deleteIf, like anyIf:
    
        a.deleteIf { $0 == "b" }
    */

    mutating func deleteAt(index: Int) -> Element? {
        if index >= 0 && index < count {
            return removeAtIndex(index)
        }
        else if index < 0 && count+index >= 0 {
            return removeAtIndex(count+index)
        }
        else {
            return nil
        }
    }

    mutating func deleteIf(invocation:((Element) -> Bool)) {
        for var i = 0; i < count; i++ {
            if invocation(self[i]) {
                removeAtIndex(i)
            }
        }
    }

    func drop(n: Int) -> [Element] {
        var result = self
        n.times { _ in result.removeAtIndex(0) }
        return result
    }

    func dropWhile(invocation:((Element) -> Bool)) -> [Element] {
        var result = self
        while invocation(result[0]) {
            result.deleteAt(0)
        }
        return result
    }

    func each(invocation:((Element) -> Void)) {
        forEach(invocation)
    }

    func eachIndex(invocation:((Int) -> Void)) {
        for var i = 0; i < count; ++i {
            invocation(i)
        }
    }

    func eachWithIndex(invocation:((Int, Element) -> Void)) {
        for var i = 0; i < count; ++i {
            invocation(i, self[i])
        }
    }

    // not like ruby, fetch() is same to at() in here
    func fetch(index: Int) -> Element? {
        return at(index)
    }

    // fill not implememnted
    func findIndex(invocation:((Element) -> Bool)) -> Int? {
        for var i = 0; i < count; ++i {
            if invocation(self[i]) { return i }
        }
        return nil
    }

    func index(invocation:((Element) -> Bool)) -> Int? {
        return findIndex(invocation)
    }

    mutating func keepIf(invocation:((Element) -> Bool)) {
        for var i = count - 1; i >= 0; --i {
            if !invocation(self[i]) {
                removeAtIndex(i)
            }
        }
    }

    var length: Int {
        return count
    }

    var many: Bool {
        return count > 1
    }

    mutating func pop(n: Int) -> [Element] {
        var result: [Element] = []
        n.times { _ in
            if let e = self.popLast() {
                result.prepend(e)
            }
        }
        return result
    }

    mutating func prepend(e: Element) {
        self.insert(e, atIndex: 0)
    }

    // push multiple elements is not applicable to generic Array

    mutating func push(e: Element) {
        append(e)
    }

    mutating func replace(arr: [Element]) {
        self = arr
    }

    func rIndex(invocation:((Element) -> Bool)) -> Int? {
        for var i = count - 1; i >= 0; --i {
            if invocation(self[i]) { return i }
        }
        return nil
    }

    func rotate(n: Int = 1) -> [Element] {
        var result = self
        if n >= 0 {
            n.times { _ in
                let first = result.removeFirst()
                result.append(first)
            }
        }
        else {
            (-n).times { _ in
                let last = result.removeLast()
                result.insert(last, atIndex: 0)
            }
        }
        return result
    }

    //TODO: sample(n) implement later while random number extension done
    func select(invocation:((Element) -> Bool)) -> [Element] {
        var result: [Element] = []
        var generator = self.generate()
        while let e = generator.next() {
            if invocation(e) {
                result.append(e)
            }
        }
        return result
    }

    mutating func selectInPlace(invocation:((Element) -> Bool)) {
        keepIf(invocation)
    }

    mutating func shift(n: Int) -> [Element] {
        var result = [Element]()
        n.times() { _ in
            result.append(self.removeFirst())
        }
        return result
    }

    // shuffle, shuffle! implement later

    var size: Int {
        return count
    }

    // take is same to fetch() and at() not like ruby
    func take(index: Int) -> Element? {
        return fetch(index)
    }

    func takeWhile(invocation:((Element) -> Bool)) -> [Element] {
        return select(invocation)
    }

    // transpose, value_at, zip not implemented

    // uniq and uniq! are not applicable to generic Array, implemented in `Array where Element: Equatable`

    // unshift multiple values is not implemented
    mutating func unshift(element: Element) -> [Element] {
        insert(element, atIndex: 0)
        return self
    }
}

@available(iOS 7.0, OSX 10.9, *)
public extension Array where Element: Equatable {
    func any(element: Element) -> Bool {
        for var i = 0; i < count; ++i {
            if element == self[i] {
                return true
            }
        }
        return false
    }

    mutating func delete(element: Element, _ invocation:((Element) -> Void)? = nil) -> Element {
        var result: [Element] = []
        var generator = self.generate()
        while let e = generator.next() {
            if e != element {
                result.append(e)
            }
        }
        result.count < count ? self = result : invocation?(element)
        return element
    }

    func findIndex(element: Element) -> Int? {
        for var i = 0; i < count; ++i {
            if self[i] == element {
                return i
            }
        }
        return nil
    }

    func uniq() -> [Element] {
        var result: [Element] = []
        var generator = self.generate()
        while let e = generator.next() {
            if result.contains(e) { continue }
            result.append(e)
        }
        return result
    }

    mutating func uniqInPlace() {
        self = uniq()
    }
}
