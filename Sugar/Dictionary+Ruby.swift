//
//  Dictionary+Ruby.swift
//  Sugar
//
//  Created by Venj on 15/11/17.
//  Copyright © 2015年 Venj. All rights reserved.
//

/**
Ruby core flavored extension for Generic `Dictionary`.
*/
@available(iOS 8.0, OSX 10.10, *)
public extension Dictionary {
    /**
     Remove all the keys and values of the dict. 
    */
    mutating func clear() {
        removeAll()
    }

    // Since Swift is strict-typed language, not like ruby's method with the same name,
    // body does not return, but we can still do something with the key while not found
    /**
    Delete a key-value pair according to the key. If key is not found, execute a closure. like Ruby's method with the same name, body does not return.
    
    - parameter key: The key to delete.
    - parameter body: The optional closure to execute if key is not found.
    - returns: The value associated with the key, or `nil` if not found.
    */
    mutating func delete(_ key: Key, _ body:((Key) -> Void)? = nil) -> Value? {
        guard let result = removeValue(forKey: key) else { body?(key); return nil }
        return result
    }

    // Not like ruby's delete_if, this method does not return self.
    /**
    Delete a key value pair use some criteria specified in closure.
    
    - parameter body: A closure accept key and value as arguments and determine whether they should be deleted.
    */
    mutating func deleteIf(_ body:(Key, Value) -> Bool) {
        var generator = makeIterator()
        while let (key, value) = generator.next() {
            if body(key, value) {
                removeValue(forKey: key)
            }
        }
    }

    /**
     Enumerate all key-value pair in the dictionary. 
     
     - parameter body: A closure accept key and value as arguments.
    */
    func each(_ body:((Key, Value) -> Void)) {
        var generator = makeIterator()
        while let (key, value) = generator.next() {
            body(key, value)
        }
    }

    /**
     Enumerate all keys in the dictionary.

     - parameter body: A closure accept dictionary key as argument.
    */
    func eachKey(_ body:((Key) -> Void)) {
        var generator = makeIterator()
        while let (key, _) = generator.next() {
            body(key)
        }
    }

    /**
     Enumerate all values in the dictionary.

     - parameter body: A closure accept dictionary value as argument.
     */
    func eachValue(_ body:((Value) -> Void)) {
        var generator = makeIterator()
        while let (_, value) = generator.next() {
            body(value)
        }
    }

    /**
     Fetch a value by key. If the key is not found, execute a closure. 
     
     - parameter key: The key to find.
     - parameter body: The optional closure to execute if key is not found.
     - returns: The value associated with the key, or `nil` if not found.
    */
    func fetch(_ key: Key, _ body:((Key) -> Void)? = nil) -> Value? {
        guard let result = self[key] else { body?(key); return nil }
        return result
    }

    // flatten is not applicable
    /**
    Determine whether the dictionary have certain key.
    
    - parameter key: A dictionary key.
    */
    func hasKey(_ key: Key) -> Bool {
        return self[key] != nil ? true : false
    }

    // hasValue not applicable to generic dictionary, implemented in `Dictionary where Value: Equatable`

    /**
    Alias for `hasKey` method.
    */
    func include(_ key: Key) -> Bool {
        return hasKey(key)
    }

    // invert is not applicable to generic Dictionary, implemented in `Dictionary where Value: Hashable`
    /**
    Keep only the key-value pairs that match the criteria specified in a closure.
    
    - parameter body: A closure accept key and value as arguments and determine whether they should be kept.
    */
    mutating func keepIf(_ body:((Key, Value) -> Bool)) {
        var generator = makeIterator()
        while let (key, value) = generator.next() {
            if !body(key, value) {
                removeValue(forKey: key)
            }
        }
    }

    // key not applicable to generic dictionary, implemented in `Dictionary where Value: Equatable`
    /**
    Number of key-value pairs in the dictionary. Alias for `count` property.
    */
    var length: Int {
        return count
    }

    /**
     Alias for `hasKey` method.
    */
    func isMember(_ key: Key) -> Bool {
        return hasKey(key)
    }

    /**
     Create a dictionary that have the current dictionary and another dictionary content merged. If both dictionary contain a same key, the later dictionary's value associated with the key will be used. 
     
     - parameter dict: A dictionary. 
     - parameter body: A closure that accept the key, the value in current dictionary, and the value in another dictionary as arguments.
     - returns: A new dictionary with all key-value pair merged together.
    */
    func merge(_ dict: [Key: Value], _ body: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        var result: [Key: Value] = self
        var dictGenerator = dict.makeIterator()
        while let (key, newValue) = dictGenerator.next() {
            guard let oldValue = self[key] else { result[key] = newValue; continue }
            guard let resultValue = body?(key, oldValue, newValue) else { result[key] = newValue; continue }
            result[key] = resultValue
        }
        return result
    }

    /**
     Merge the content of another dictionary into the current dictionary. Dictionary is changed.
     
     - parameter dict: A dictionary.
     - parameter body: A closure that accept the key, the value in current dictionary, and the value in another dictionary as arguments.
     - returns: Current dictionary after merge.
    */
    mutating func mergeInPlace(_ dict: [Key: Value], _ body: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        var dictGenerator = dict.makeIterator()
        while let (key, newValue) = dictGenerator.next() {
            guard let oldValue = self[key] else { self[key] = newValue; continue }
            guard let resultValue = body?(key, oldValue, newValue) else { self[key] = newValue; continue }
            self[key] = resultValue
        }
        return self
    }

    /**
     Create a new dictionary and reject key-value pair that are not satisfy certain condition based on both key and value. 
     
     `delete` method is only based on the key.
     
     - parameter body: A closure accept key and value as arguments and determine whether they should be rejected in the new array.
     - returns: A new array with some key-value pair rejected.
    */
    func reject(_ body:((Key, Value) -> Bool)) -> [Key: Value] {
        var result: [Key: Value] = [:]
        var generator = self.makeIterator()
        while let (key, value) = generator.next() {
            if !body(key, value) {
                result[key] = value
            }
        }
        return result
    }

    // Like the reject! in ruby, functions the like delete_if! but return nil while nothing changed
    /**
    Reject key-value pair that are not satisfy certain condition based on both key and value from current dictionary.

    - parameter body: A closure accept key and value as arguments that determine whether they should be rejected in the new array.
    - returns: If any key-value pair is rejected, return the dictionary after reject. Or `nil` if nothing changed.
    */
    mutating func rejectInPlace(_ body:(Key, Value) -> Bool) -> [Key: Value]? {
        var anyChange = false
        var generator = makeIterator()
        while let (key, value) = generator.next() {
            if body(key, value) {
                anyChange = true
                removeValue(forKey: key)
            }
        }
        return anyChange ? self : nil
    }

    /**
     Replace the current dictionary's content with a brand new one. 
     
     - parameter dict: The new dictionary to replace the current one. 
     - returns: Dictionary after replacement.
    */
    mutating func replace(_ dict: [Key: Value]) -> [Key: Value] {
        self = dict
        return self
    }

    /**
     Create a new dictionary that matches some certain criteria and return it. 
     
     - parameter body: A closure accept key and value as arguments that determine whether they should be seleted to the new array.
    */
    func select(_ body:((Key, Value) -> Bool)) -> [Key: Value] {
        var result: [Key: Value] = [:]
        var generator = self.makeIterator()
        while let (key, value) = generator.next() {
            if body(key, value) {
                result[key] = value
            }
        }
        return result
    }

    /**
     Like `keepIf`, only this one returns the dictionary if the original dictionary changes. 
     
     - parameter body: A closure accept key and value as arguments and determine whether they should be selected.
    */
    mutating func selectInPlace(_ body:((Key, Value) -> Bool)) -> [Key: Value]? {
        var anyChange = false
        var generator = makeIterator()
        while let (key, value) = generator.next() {
            if !body(key, value) {
                anyChange = true
                removeValue(forKey: key)
            }
        }
        return anyChange ? self : nil
    }

    /**
     Shift out the first key-value pair. Alias for `popFirst`. 
     
     Since dictionary is not sorted, the sequence is largely based on key's hash value. You may not sure about which key-value pair would be shift out, only by looking at the dictionary it self.
    */
    mutating func shift() -> (Key, Value)? {
        return popFirst()
    }

    /**
     Alias for `count` property.
    */
    var size: Int {
        return count
    }

    /**
     Save a value to a key and returns the value. 
     
     - parameter key: A key to use. 
     - parameter value: The value associated with the key. 
     - returns: The value that has been stored.
    */
    mutating func store(_ key: Key, value: Value) -> Value {
        self[key] = value
        return value
    }

    // update and mergeInPlace are the same
    /**
    Alias for `mergeInPlace` method.
    */
    mutating func update(_ dict: [Key: Value], _ body: ((Key, Value, Value) -> Value)? = nil) -> [Key: Value] {
        return mergeInPlace(dict, body)
    }

}

@available(iOS 8.0, OSX 10.10, *)
public extension Dictionary where Value: Equatable {
    /**
     Find the first key using a value. 
     
     - parameter value: A value used to search for a key. 
     - returns: If key if found then return the key; return `nil` if otherwise.
    */
    func key(_ value: Value) -> Key? {
        var result: Key? = nil
        keys.forEach {
            if self[$0] == value {
                result = $0
            }
        }
        return result
    }

    /**
     Determine whether the dictionary contains a certain value. 
     
     - returns: If value is found, return `true`.
    */
    func hasValue(_ value: Value) -> Bool {
        var result: Bool = false
        keys.forEach {
            if self[$0] == value {
                result = true
            }
        }
        return result
    }
}

@available(iOS 8.0, OSX 10.10, *)
public extension Dictionary where Value: Hashable {
    // invertInplace is not applicable
    /**
    Create a new dictionary with key-value pair inverted. That means the key became value, and the value became key. Because key is unique, but value is not, if there are many same values in the original array, when inverting the dictionary, the key comes late will be kept.
    
    - returns: A new dictionary with keys and values inverted.
    */
    func invert() -> [Value: Key] {
        var result: [Value: Key] = [:]
        each { (key, value) -> Void in
            result[value] = key
        }
        return result
    }
}
