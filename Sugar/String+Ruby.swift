//
//  String+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/13.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

//MARK: - String Operators
infix operator % { associativity left precedence 140 }
@available(iOS 7.0, OSX 10.9, *)
func %(lhs: String, rhs: [AnyObject]) {
    //TODO: Use va_args to implement
}

@available(iOS 7.0, OSX 10.9, *)
func *(lhs: String, rhs:Int) -> String {
    if rhs < 0 {
        fatalError("String can not multiply by negtive number.")
    }
    var result = ""
    for var i = 0; i < rhs; ++i {
        result += lhs
    }
    return result
}

// This operator is different from Ruby's implementation.
// Since manipulate with unicode point is difficult, we
// are not convert Int to char while using this operator
// like ruby did.
infix operator << { associativity left precedence 140 }
@available(iOS 7.0, OSX 10.9, *)
func <<<T>(lhs: String, rhs: T) -> String {
    return lhs + String(rhs)
}

infix operator <=> { associativity left precedence 140 }
@available(iOS 7.0, OSX 10.9, *)
func <=>(lhs: String, rhs: String) -> Int {
    if lhs > rhs { return 1 }
    else if lhs == rhs { return 0 }
    else { return -1 }
}


@available(iOS 7.0, OSX 10.9, *)
public extension String {
    // Byte related methods are not included currently
    // b(), bytes(), bytesize(), byteslice()

    // Shortcut for capitalizedString property

    subscript(index: Int) -> String {
        let startIndex = self.startIndex
        let position = startIndex.advancedBy(index)
        let endIndex = startIndex.advancedBy(index+1)
        let range = Range<Index>(start:position, end:endIndex)
        return self.substringWithRange(range)
    }

    subscript(intRange: Range<Int>) -> String {
        let stringOrigin = self.startIndex
        let startIndex = stringOrigin.advancedBy(intRange.startIndex)
        let endIndex = startIndex.advancedBy(intRange.endIndex - intRange.startIndex)
        let range = Range<Index>(start:startIndex, end:endIndex)
        return self.substringWithRange(range)
    }

    func capitalize() -> String {
        return self.capitalizedString
    }

    func casecomp(rhs:String) -> Int {
        return self.lowercaseString <=> rhs.lowercaseString
    }

    func center(size: Int, padString:String = " ") -> String {
        let padSize = padString.characters.count
        if padSize == 0 { fatalError("padString can not be zero length") }
        let count = self.characters.count
        if self.characters.count <= size { return self }
        let leftPadSpace = (size - count) / 2
        let rightPadSpace = leftPadSpace + (size - count) % 2
        if padSize == 1 {
            return padString * leftPadSpace + self + padString * rightPadSpace
        }
        else {
            var (leftPad, rightPad) = ("", "")
            for var i = 0, j = 0; i < leftPadSpace; ++i, ++j {
                if j % padSize == 0 { j = 0 }
                leftPad += padString[j]
            }
            for var i = 0, j = 0; i < rightPadSpace; ++i, ++j {
                if j % padSize == 0 { j = 0 }
                rightPad += padString[j]
            }
            return leftPad + self + rightPad
        }
    }

    // May not a good implementation, just mimic ruby's chomp method
    func chomp(separator: String? = nil) -> String {
        func isChar(char: Character, inSet set: NSCharacterSet) -> Bool {
            return set.characterIsMember(String(char).utf16.first!)
        }
        var result = self
        let lastCharIndex = self.endIndex.advancedBy(-1)
        let range = Range<Index>(start:lastCharIndex, end:self.endIndex)
        let lastCharString = result.substringWithRange(range)
        if isChar(lastCharString.characters.first!, inSet: NSCharacterSet.newlineCharacterSet()) {
            while (result.hasSuffix(lastCharString)) {
                guard let range = result.rangeOfString(lastCharString, options: .BackwardsSearch, range: nil, locale: nil) else { return result }
                result.removeRange(range)
            }
        }
        else {
            result.removeRange(range)
        }

        return result
    }

    func chop(inPlace: Bool = false) -> String {
        var result = self
        let lastCharIndex = self.endIndex.advancedBy(-1)
        let range = Range<Index>(start:lastCharIndex, end:self.endIndex)
        result.removeRange(range)
        return result
    }

    mutating func clear() {
        self = ""
    }

    // chr, chomp!, chop!,  are not implemented

    // codepoints not implemented, since String has better solutions
    func concat<T>(obj: T) -> String {
        return self << obj
    }

    func count() -> Int {
        return self.characters.count
    }

    // crypt not implemented

    func delete() {
        //TODO: Use va_args to implement
    }

    //TODO: also implement deleteInPlace() here

    func downcase() -> String {
        return self.lowercaseString
    }

    mutating func downcaseInPlace() {
        self = self.lowercaseString
    }

    // dump not implemented

    // each_byte, each_codepoint not implemented

    func eachChar( invocation: ((_:Character) -> Void) ) {
        for char in self.characters {
            invocation(char)
        }
    }

    func eachLine( invocation: ((_:String) -> Void) ) {
        let lines = self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        for line in lines {
            invocation(line)
        }
    }

    var empty: Bool {
        return self.isEmpty
    }

    func encode(toEncoding: NSStringEncoding, fromEncoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        guard let data = self.dataUsingEncoding(fromEncoding) else { return nil }
        let result = String(data: data, encoding: toEncoding)
        return result
    }

    // encoding is not applicable; encode!, force_encoding, get_byte not implemented

    func endWith(suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }
    
}
