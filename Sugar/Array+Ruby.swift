//
//  Array+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/17.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

/**
Ruby core flavored extension for Generic `Array`.
*/
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
    func anyIf(_ element: Element, _ invocation: ((Element, Element) -> Bool)) -> Bool {
        for i in 0..<count {
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
    func at(_ position: Int) -> Element? {
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
    /**
    Remove all the elements in the array.
    */
    mutating func clear() {
        removeAll()
    }

    /**
     Alias for `map` method.
    */
    func collect<T>(_ invocation:(Element) -> T) -> [T] {
        return map(invocation)
    }

    // collect!, compact, compact! is not applicable

    // combination not implement
    /**
    Create a new array and add all the elements from current array and another array. 
    
    - parameter arr: An array. 
    - returns: A new array contails all elements from two arrays.
    */
    func concat(_ arr: [Element]) -> [Element] {
        return self + arr
    }

    // endless cycle is not implemented to avoid misuse
    /**
    Cycle through an array for a number of times. 
    
    - parameter cycles: Number of cycles to go through the array. 
    - parameter invocation: An closure that accept current element as agrument.
    */
    func cycle(_ cycles:Int, _ invocation:(Element) -> Void) {
        var index = 0
        while true {
            if index == count * cycles { break }
            invocation(self[index % count])
            index += 1
        }
    }

    /*
    delete not applicable to generic array use deleteIf, like anyIf:
    
        a.deleteIf { $0 == "b" }
    */
    /**
    Delete an element at specified index and return it. 
    
    - parameter position: Element position. 
    - returns: The deleted element, or `nil` if position is out of bounds.
    */
    mutating func deleteAt(_ position: Int) -> Element? {
        if position >= 0 && position < count {
            return remove(at: position)
        }
        else if position < 0 && count+position >= 0 {
            return remove(at: count+position)
        }
        else {
            return nil
        }
    }

    /**
     Delete elements that satisfy certain condition.
     
     - parameter invocation: A closure accept current element as argument and return a boolean that determines whether delete the element or not.
    */
    mutating func deleteIf(_ invocation:((Element) -> Bool)) {
        for i in (0..<count).reversed() {
            if invocation(self[i]) {
                remove(at: i)
            }
        }
    }

    /**
     Create a new array with first several elements remove based on the original array. 
     
     - parameter n: Number of elements to drop. 
     - returns:
    */
    func drop(_ n: Int) -> [Element] {
        var result = self
        n.times { _ in result.remove(at: 0) }
        return result
    }

    /**
     Create a new array with elements satisfy a certain condisition deleted. 
     
     - parameter invocation: A closure accept current element as argument and return a boolean to indicate whether delete the element or not. 
     - returns: A new array with proper elements removed.
    */
    func dropWhile(_ invocation:((Element) -> Bool)) -> [Element] {
        var result = self
        while invocation(result[0]) {
            _ = result.deleteAt(0)
        }
        return result
    }

    /**
     Alias for `forEacy` method.
    */
    func each(_ invocation:((Element) -> Void)) {
        forEach(invocation)
    }

    /**
     Enumerate through all the indexes of the array. 
     
     - parameter invocation: A closure to process these indexes.
    */
    func eachIndex(_ invocation:((Int) -> Void)) {
        for i in 0..<count {
            invocation(i)
        }
    }

    /**
     Enumerate through the array with element and its index pass to a closure. 
     
     - parameter invocation: A closure to process these elements and their indexes.
    */
    func eachWithIndex(_ invocation:((Int, Element) -> Void)) {
        for i in 0..<count {
            invocation(i, self[i])
        }
    }

    // not like ruby, fetch() is same to at() in here
    /**
    Alias for `at` method.
    */
    func fetch(_ index: Int) -> Element? {
        return at(index)
    }

    // fill not implememnted
    /**
    Find an element's first index using a closure.
    
    - parameter invocation: A closure take element as argument and return a boolean.
    */
    func findIndex(_ invocation:((Element) -> Bool)) -> Int? {
        for i in 0..<count {
            if invocation(self[i]) { return i }
        }
        return nil
    }

    /**
     Alias for `findIndex` method.
    */
    func index(_ invocation:((Element) -> Bool)) -> Int? {
        return findIndex(invocation)
    }

    /**
     Remove all the elements that can not pass the test of the closure from the original array. 
     
     - parameter invocation: A closure take element as argument and return a boolean.
    */
    mutating func keepIf(_ invocation:((Element) -> Bool)) {
        for i in (0..<count).reversed() {
            if !invocation(self[i]) {
                remove(at: i)
            }
        }
    }

    /**
     Alias for `count` property.
    */
    var length: Int {
        return count
    }

    /**
     Determine whether the array contains more than one element.
    */
    var many: Bool {
        return count > 1
    }

    /**
     Pop a number of element from the end of the original array. 
     
     - parameter n: Number of elements to pop out.
     - returns: An array contains the elements that are pop-ed.
    */
    mutating func pop(_ n: Int) -> [Element] {
        var result: [Element] = []
        n.times { _ in
            if let e = self.popLast() {
                result.prepend(e)
            }
        }
        return result
    }

    /**
     Prepend an element at the front of an array. 
     
     - parameter element: An element.
    */
    mutating func prepend(_ element: Element) {
        self.insert(element, at: 0)
    }

    // push multiple elements is not applicable to generic Array

    /**
    Push an element into the original array.
    */
    mutating func push(_ element: Element) {
        append(element)
    }

    /**
     Replace the original array with another array. 
     
     - parameter arr: An array.
    */
    mutating func replace(_ arr: [Element]) {
        self = arr
    }

    /**
     Find the last index of an element. 
     
     - parameter invocation: A closure take element as argument and return a boolean.
     - returns: If found, return the index in `Int`, or `nil` if not found.
    */
    func rIndex(_ invocation:((Element) -> Bool)) -> Int? {
        for i in (0..<count).reversed() {
            if invocation(self[i]) { return i }
        }
        return nil
    }

    /**
     Create a new array with all the elements rotated for a certain number of positions. 
     
        [1, 2, 3, 4, 5, 6, 7, 8].rotate(2) // returns: [3, 4, 5, 6, 7, 8, 1, 2]
        [1, 2, 3, 4, 5, 6, 7, 8].rotate(-2) // returns: [7, 8, 1, 2, 3, 4, 5, 6]
     
     - parameter n: Rotate `n` positions. Minus value rotate counter-clockwise.
     - returns: A new array with elements rotated.
    */
    func rotate(_ n: Int = 1) -> [Element] {
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
                result.insert(last, at: 0)
            }
        }
        return result
    }

    //TODO: sample(n) implement later while random number extension done
    /**
    Create a new array with elements filtered by a closure. 
    
    - parameter invocation: A closure take element as argument and return a boolean.
    - returns: A new array with elements pass through the filtration of the closure.
    */
    func select(_ invocation:((Element) -> Bool)) -> [Element] {
        var result: [Element] = []
        var generator = self.makeIterator()
        while let e = generator.next() {
            if invocation(e) {
                result.append(e)
            }
        }
        return result
    }

    /**
     Alias for `keepIf` method.
    */
    mutating func selectInPlace(_ invocation:((Element) -> Bool)) {
        keepIf(invocation)
    }

    /**
     Shift out a certain number of elements at the front of an array. 
     
     - parameter n: Number of elements to shift out.
     - returns: An array contains the elements that are shifted.
    */
    mutating func shift(_ n: Int) -> [Element] {
        var result = [Element]()
        n.times() { _ in
            result.append(self.removeFirst())
        }
        return result
    }

    // shuffle, shuffle! implement later

    /**
    Alias for `count` property.
    */
    var size: Int {
        return count
    }

    // take is same to fetch() and at() not like ruby
    /**
    Alias for `fetch` method.
    */
    func take(_ index: Int) -> Element? {
        return fetch(index)
    }

    /**
     Alias for `select` method.
    */
    func takeWhile(_ invocation:((Element) -> Bool)) -> [Element] {
        return select(invocation)
    }

    // transpose, value_at, zip not implemented

    // uniq and uniq! are not applicable to generic Array, implemented in `Array where Element: Equatable`

    // unshift multiple values is not implemented
    /**
    Unshift an element into the original array. 
    
    - parameter element: The element to unshift.
    - returns: Array with an element unshifted into.
    */
    mutating func unshift(_ element: Element) -> [Element] {
        insert(element, at: 0)
        return self
    }
}

@available(iOS 7.0, OSX 10.9, *)
public extension Array where Element: Equatable {
    /**
     Determine whether an element is contained in the array or not. Alias for `contains`.
    */
    func any(_ element: Element) -> Bool {
        return contains(element)
    }

    /**
     Delete all occurance of one element. If a closure is specified, then execute the closure if delete actually happened.
     
     - parameter element: The element to delete. 
     - parameter invocation: An optional closure that will be executed if no element found.
     - returns: The element that has been deleted.
    */
    mutating func delete(_ element: Element, _ invocation:((Element) -> Void)? = nil) -> Element? {
        var result: [Element] = []
        var generator = self.makeIterator()
        while let e = generator.next() {
            if e != element {
                result.append(e)
            }
        }
        if result.count < count {
            self = result
            return element
        }
        else {
            invocation?(element)
            return nil
        }
    }

    /**
     Found the first index of an element. 
     
     - parameter element: The element need to be found. 
     - returns: The position of the first occurance of the element, or `nil` if not found.
    */
    func findIndex(_ element: Element) -> Int? {
        for i in 0..<count {
            if self[i] == element {
                return i
            }
        }
        return nil
    }

    /**
     Create a new array with no duplicated element of the original array. The sequence is not changed.
     
     - returns: A new array contains only unique element
    */
    func uniq() -> [Element] {
        var result: [Element] = []
        var generator = self.makeIterator()
        while let e = generator.next() {
            if result.contains(e) { continue }
            result.append(e)
        }
        return result
    }

    /**
     Remove all the duplication of any element in the original array.
    */
    mutating func uniqInPlace() {
        self = uniq()
    }
}
