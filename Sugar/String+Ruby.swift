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
    fatalError("not implemented")
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
    
    subscript(nsRange: NSRange) -> String {
        let range = self.rangeFromNSRange(nsRange)
        return self[range]
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

    func delete() -> String {
        //TODO: Use va_args to implement
        fatalError("not implemented")
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

    func gsub(pattern:String, replacement:String) -> String? {
        var result: String? = self
        result = self.gsub(pattern) { (match) in
            return ""
        }
        return result
    }

    // Not good... Anyway to get rid of one of the loops?
    func gsub(pattern:String, invocation:( (_: NSTextCheckingResult) -> String )) -> String? {
        var result: String? = self
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive) else { return nil }
        let matches = regex.matchesInString(self, options: [], range: NSRange(location:0, length: self.characters.count))
        var replaces: [(String, String)] = []
        for match in matches {
            replaces.append( (self[match.range], invocation(match)) )
        }
        for replace in replaces {
            result = result?.stringByReplacingOccurrencesOfString(replace.0, withString: replace.1)
        }
        return result
    }

    // gsub! not implemented
    // hash is already implemented by standard library
    // hex not implemented

    func include(subString: String) -> Bool {
        return self.containsString(subString)
    }

    func index(subString: String, isRegex: Bool = false, isReverse: Bool = false,  offset: Int = 0) -> Int? {
        let stringLength = self.characters.count
        let searchOffset = (stringLength + offset) % stringLength
        let searchRange = Range<Index>(start: startIndex.advancedBy(searchOffset), end: endIndex)
        var options: NSStringCompareOptions = isRegex ? [.RegularExpressionSearch] : []
        if isReverse { options.insert(.BackwardsSearch) }
        guard let range = self.rangeOfString(subString, options:options, range: searchRange, locale: nil) else { return nil }
        return startIndex.distanceTo(range.startIndex)
    }

    mutating func insert(index:Int, subString: String) -> String {
        let offset = index > 0 ? index : self.characters.count + index + 1
        self.insertContentsOf(subString.characters, at: startIndex.advancedBy(offset))
        return self
    }

    // inspect is not implemented
    // intern is not applicaable

    func length() -> Int {
        return self.characters.count
    }

    func lines() -> [String] {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
    }
    
    func ljust(totalLength:Int, padString: String = " ") -> String {
        let stringLength = self.characters.count
        if totalLength <= stringLength {
            return self
        }
        else {
            var result = self
            let padSize = padString.characters.count
            for var i = stringLength, j = 0; i < totalLength; ++i, ++j {
                if j % padSize == 0 { j = 0 }
                result += padString[j]
            }
            return result
        }
    }
    
    func lstrip() -> String {
        var result = self
        guard let range = self.rangeOfString("^\\s+", options: [.RegularExpressionSearch, .AnchoredSearch], range: nil) else { return self }
        result.replaceRange(range, with: "")
        return result
    }
    
    // Not like ruby, this method will not return
    mutating func lstripInPlace() {
        self = self.lstrip()
    }
    
    func match(pattern:String, offset: Int = 0, invocation:((NSTextCheckingResult) -> Void)? = nil) -> NSTextCheckingResult? {
        let stringLength = self.characters.count
        let searchOffset = (stringLength + offset) % stringLength
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive) else { return nil }
        return regex.firstMatchInString(self, options: [], range: NSRange(location: searchOffset, length: stringLength - searchOffset))
    }
        
    // next/succ, oct, ord not implemented
    
    func prepend(prefix: String) -> String {
        return prefix + self
    }
    
    mutating func replace(anotherString: String) -> String {
        self = anotherString
        return self
    }
    
    func reverse() -> String {
        return String(self.characters.reverse())
    }
    
    mutating func reverseInPlace() -> String {
        self = self.reverse()
        return self
    }
    
    // The implementation is done in index()
    func rindex(subString: String, isRegex: Bool = false, offset: Int = 0) -> Int? {
        return self.index(subString, isRegex: isRegex, isReverse:true, offset: offset)
    }
    
    func rjust(totalLength: Int, padString: String = " ") -> String {
        let stringLength = self.characters.count
        if totalLength <= stringLength {
            return self
        }
        else {
            var result = ""
            let padSize = padString.characters.count
            let stringLength = self.characters.count
            for var i = 0, j = 0; i < totalLength - stringLength; ++i, ++j {
                if j % padSize == 0 { j = 0 }
                result += padString[j]
            }
            result += self
            return result
        }
    }
    
    
    func rpartition(separator: String, isRegex: Bool = false) -> [String]? {
        //TODO: implement later.
        fatalError("not implemented")
    }
    
    func rstrip() -> String {
        var result = self
        guard let range = self.rangeOfString("\\s+$", options: [.RegularExpressionSearch, .AnchoredSearch], range: nil) else { return self }
        result.replaceRange(range, with: "")
        return result
    }
    
    // Not like ruby, this method will not return
    mutating func rstripInPlace() {
        self = self.rstrip()
    }
    
    //FIXME: ruby can use a block with variable amount of arguments. Maybe we can pass an array of matched strings or range?
    func scan(pattern:String, invocation:((NSTextCheckingResult) -> Void)? = nil) -> [NSTextCheckingResult]? {
        let stringLength = self.characters.count
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive) else { return nil }
        let matches = regex.matchesInString(self, options: [], range: NSRange(location: 0, length: stringLength))
        if matches.count == 0 {
            return nil
        }
        else {
            for match in matches {
                invocation?(match)
            }
            return matches
        }
    }

}
