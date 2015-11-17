//
//  Array+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/17.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)

func *<Element>(lhs: Array<Element>, rhs: Int) -> [Element] {
    var result: [Element] = []
    rhs.times { (index) -> Void in
        result.appendContentsOf(lhs)
    }
    return result
}

func +<Element>(lhs: Array<Element>, rhs: Array<Element>) -> [Element] {
    var result: [Element] = lhs
    result.appendContentsOf(rhs)
    return result
}

// Anyway to implement & or - or | ?
func <<<Element>(lhs:Array<Element>, rhs: Element) -> [Element] {
    var result: [Element] = lhs
    result.append(rhs)
    return result
}

public extension Array {
    /*
        any is not applicable to generic Array
        You can use the anyIf method to reach the same function:

            a.anyIf("b") { $0 == $1 }  // true, suppose: let a = ["a", "b", "c"]
    
        or simply:

            a.anyIf("b", ==)
    */

    func anyIf(e: Element, _ invocation: ((Element, Element) -> Bool)) -> Bool {
        for var i = 0; i < count; ++i {
            if invocation(e, self[i]) {
                return true
            }
        }
        return false
    }

    func at(index: Int) -> Element? {
        if index >= 0 && index < count {
            return self[index]
        }
        else if index < 0 && count+index >= 0 {
            return self[count+index]
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

    func drop(n: Int) throws -> [Element] {
        var result = self
        n.times { _ in result.removeAtIndex(0) }
        return result
    }

    func dropWhile(invocation:((Element) -> Bool)) -> [Element] {
        var result: [Element] = []
        for var i = 0; i < count; ++i {
            if !invocation(self[i]) {
                result.append(self[i])
            }
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

    // not like ruby, fetch() is same to at() in here
    func fetch(index: Int) -> Element? {
        return at(index)
    }

    // fill not implememnted

    // findIndex(Element) is not applicable to generic Array
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
        for var i = 0; i < count; i++ {
            if !invocation(self[i]) {
                removeAtIndex(i)
            }
        }
    }

    var length: Int {
        return count
    }

    mutating func pop(n: Int) -> [Element] {
        var result: [Element] = []
        n.times { _ in
            if let e = self.popLast() {
                result.append(e)
            }
        }
        return result
    }

    mutating func prepend(e: Element) {
        self.insert(e, atIndex: 0)
    }

    // push is not applicable to generic Array

    mutating func push(e: Element) {
        append(e)
    }

    mutating func replace(arr: [Element]) {
        self = arr
    }

    func rIndex(invocation:((Element) -> Bool)) -> Int? {
        for var i = count - 1; i <= 0; --i {
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

    mutating func shift(n: Int) -> Element? {
        return removeFirst()
    }

    // shuffle, shuffle! implement later

    var size: Int {
        return count
    }

    // slice, sort

    // take is same to fetch() and at() not like ruby
    func take(index: Int) -> Element? {
        return fetch(index)
    }

    func takeWhile(invocation:((Element) -> Bool)) -> [Element] {
        return select(invocation)
    }

    // transpose, uniq uniq!, unshift, value_at, zip not implemented
}
