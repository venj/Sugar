//
//  Dictionary+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/17.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

@available(iOS 7.0, OSX 10.9, *)
public extension Dictionary {

    mutating func clear() {
        removeAll()
    }

    // Since Swift is strict-typed language, not like ruby's method with the same name,
    // invocation does not return, but we can still do something with the key while not found
    mutating func delete(key: Key, _ invocation:((Key) -> Void)? = nil) -> Value? {
        guard let result = removeValueForKey(key) else { invocation?(key); return nil }
        return result
    }

    // Not like ruby's delete_if, this method does not return self.
    mutating func deleteIf(invocation:(Key, Value) -> Bool) {
        var generator = generate()
        while let (key, value) = generator.next() {
            if invocation(key, value) {
                removeValueForKey(key)
            }
        }
    }

    func each(invocation:((Key, Value) -> Void)) {
        var generator = generate()
        while let (key, value) = generator.next() {
            invocation(key, value)
        }
    }

    func eachKey(invocation:((Key) -> Void)) {
        var generator = generate()
        while let (key, _) = generator.next() {
            invocation(key)
        }
    }

    func eachValue(invocation:((Value) -> Void)) {
        var generator = generate()
        while let (_, value) = generator.next() {
            invocation(value)
        }
    }

    func fetch(key: Key, _ invocation:((Key) -> Void)? = nil) -> Value? {
        guard let result = self[key] else { invocation?(key); return nil }
        return result
    }

    // flatten is not applicable

    func hasKey(key: Key) -> Bool {
        return self[key] != nil ? true : false
    }

    // hasValue not applicable to generic dictionary, implemented in `Dictionary where Value: Equatable`

    func include(key: Key) -> Bool {
        return hasKey(key)
    }

    // invert is not applicable to generic Dictionary, implemented in `Dictionary where Value: Hashable`

    mutating func keepIf(invocation:((Key, Value) -> Bool)) {
        var generator = generate()
        while let (key, value) = generator.next() {
            if !invocation(key, value) {
                removeValueForKey(key)
            }
        }
    }

    // key not applicable to generic dictionary, implemented in `Dictionary where Value: Equatable`

    var length: Int {
        return count
    }

    func isMember(key: Key) -> Bool {
        return hasKey(key)
    }

    func merge(dict: [Key: Value], _ invocation: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        var result: [Key: Value] = self
        var dictGenerator = dict.generate()
        while let (key, newValue) = dictGenerator.next() {
            guard let oldValue = self[key] else { result[key] = newValue; continue }
            guard let resultValue = invocation?(key, oldValue, newValue) else { result[key] = newValue; continue }
            result[key] = resultValue
        }
        return result
    }

    mutating func mergeInPlace(dict: [Key: Value], _ invocation: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        var dictGenerator = dict.generate()
        while let (key, newValue) = dictGenerator.next() {
            guard let oldValue = self[key] else { self[key] = newValue; continue }
            guard let resultValue = invocation?(key, oldValue, newValue) else { self[key] = newValue; continue }
            self[key] = resultValue
        }
        return self
    }

    func reject(invocation:((Key, Value) -> Bool)) -> [Key: Value] {
        var result: [Key: Value] = [:]
        var generator = self.generate()
        while let (key, value) = generator.next() {
            if !invocation(key, value) {
                result[key] = value
            }
        }
        return result
    }

    // Like the reject! in ruby, functions the like delete_if! but return nil while nothing changed
    mutating func rejectInPlace(invocation:(Key, Value) -> Bool) -> [Key: Value]? {
        var anyChange = false
        var generator = generate()
        while let (key, value) = generator.next() {
            if invocation(key, value) {
                anyChange = true
                removeValueForKey(key)
            }
        }
        return anyChange ? self : nil
    }

    mutating func replace(dict: [Key: Value]) -> [Key: Value] {
        self = dict
        return self
    }

    func select(invocation:((Key, Value) -> Bool)) -> [Key: Value] {
        var result: [Key: Value] = [:]
        var generator = self.generate()
        while let (key, value) = generator.next() {
            if invocation(key, value) {
                result[key] = value
            }
        }
        return result
    }

    mutating func selectInPlace(invocation:((Key, Value) -> Bool)) -> [Key: Value]? {
        var anyChange = false
        var generator = generate()
        while let (key, value) = generator.next() {
            if !invocation(key, value) {
                anyChange = true
                removeValueForKey(key)
            }
        }
        return anyChange ? self : nil
    }

    mutating func shift() -> (Key, Value)? {
        return popFirst()
    }

    var size: Int {
        return count
    }

    mutating func store(key: Key, value: Value) -> Value {
        self[key] = value
        return value
    }

    // update and mergeInPlace are the same
    mutating func update(dict: [Key: Value], _ invocation: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        return mergeInPlace(dict, invocation)
    }

}

@available(iOS 7.0, OSX 10.9, *)
public extension Dictionary where Value: Equatable {
    func key(value: Value) -> Key? {
        var result: Key? = nil
        keys.forEach {
            if self[$0] == value {
                result = $0
            }
        }
        return result
    }

    func hasValue(value: Value) -> Bool {
        var result: Bool = false
        keys.forEach {
            if self[$0] == value {
                result = true
            }
        }
        return result
    }
}

@available(iOS 7.0, OSX 10.9, *)
public extension Dictionary where Value: Hashable {
    // invertInplace is not applicable
    func invert() -> [Value: Key] {
        var result: [Value: Key] = [:]
        each { (key, value) -> Void in
            result[value] = key
        }
        return result
    }
}
