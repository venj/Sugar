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

// Anyway to implement & and - ?
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

}
