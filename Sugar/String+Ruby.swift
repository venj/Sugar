//
//  String+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/13.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

/**
 Ruby Core flavored string extension. 
*/
@available(iOS 7.0, OSX 10.9, *)
public extension String {
    // Static function
    /**
    This method will generate an UUID string. This is not a trivial UUID implementation.
    But more like a custom baked UUID.

    - returns: A variable length UUID string.
    */
    static func UUIDString() -> String {
        let uuid = UUID()
        return uuid.uuidString
    }

    // Byte related methods are not included currently
    // b(), bytes(), bytesize(), byteslice()

    /**
    Subscript of `String` using `Int` as index. 
    
    - parameter index: An `Int` value that indicate the index of a character.
    - returns: A string contains a character. Not the Swift `Character` object.
    */
    subscript(index: Int) -> String? {
        if index >= count || index < 0 && abs(index) > count {
            return nil
        }
        let pos = (index < 0 && -index <= count) ? (count + index) : index
        let range = NSRange(location: pos, length: 1)
        return substring(withNSRange: range)
    }

    // minus int range not implemented

    /**
     Subscript of `String` using `ClosedRange<Int>` as range. Note: Range contains minus
     minus int value is not supported. If you pass in a Range contains minus value,
     the behavior is unpredictable.

     - parameter intRange: A closed integer range. You can create a Swift native `Int` range
     by `1...5` range literials.
     - returns: Substring within the range.
     */
    subscript(intRange: ClosedRange<Int>) -> String? {
        let range = NSRange(location: intRange.lowerBound, length: intRange.count)
        return substring(withNSRange: range)
    }

    /**
    Subscript of `String` using `Range<Int>` as range. Note: Range contains minus
    minus int value is not supported. If you pass in a Range contains minus value,
    the behavior is unpredictable. 
    
    - parameter intRange: An open integer range. You can create a Swift native `Int` range
    by `2..<6` range literials.
    - returns: Substring within the range.
    */
    subscript(intRange: Range<Int>) -> String? {
        let range = NSRange(location: intRange.startIndex, length: intRange.count)
        return substring(withNSRange: range)
    }

    /**
     Subscript of `String` using `NSRange` as range. Note: Range contains minus
     minus int value is not supported. If you pass in a invalid range, app will 
     crash.

     - parameter nsRange: A `NSRange` C-struct.
     - returns: Substring within the range.
     */
    subscript(nsRange: NSRange) -> String? {
        return substring(withNSRange: nsRange)
    }

    // ascii_only? not implemented
    /**
     Capitalize a string. This is a shortcut method for `capitalizedString` property.
    
     - returns: The capitalized string of the original string.
    */
    func capitalize() -> String {
        return capitalized
    }

    /**
     Compare string with another string and not consider cases.

     - parameter aString: Any other string.
     - returns: `1` is returned if string is larger than `aString` according to string encoding
     `0` is returned if strings are the same (without consider cases).
     `-1` is returned if string is smaller than `aString`.
    */
    func casecmp(_ aString: String) -> Int {
        return lowercased() <=> aString.lowercased()
    }

    /**
     Make a long string and center the original string inside the resulting string. The other part are filled with a padding string.
     
     - parameter size: The length of the resulting string. 
     - parameter padString: Padding string that fill the space beside the center string. 
     - returns: A longer string with original string centered.
    */
    func center(_ size: Int, padString:String = " ") -> String {
        let padSize = padString.count
        if padSize == 0 { fatalError("padString can not be zero length") }
        if count >= size { return self }
        let leftPadSpace = (size - count) / 2
        let rightPadSpace = leftPadSpace + (size - count) % 2
        if padSize == 1 {
            return padString * leftPadSpace + self + padString * rightPadSpace
        }
        else {
            var (leftPad, rightPad) = ("", "")
            for i in 0..<leftPadSpace {
                leftPad += padString[i % padSize] ?? ""
            }
            for i in 0..<rightPadSpace {
                rightPad += padString[i % padSize] ?? ""
            }
            return leftPad + self + rightPad
        }
    }

    // Copied from Swift Package Manager source code with a little modification.
    /**
    Return a string that all new line characters or any characters that user specified from the end of a string are removed. e.g.:
    
        "hello\r".chomp() // return: hello
        "hello\r\r".chomp() // return: hello
        "hello\r\n\r\n".chomp() // return: hello
        "hello\r\n\n\r".chomp() // return: hello\r\n\n
        "hello".chomp("llo") // return: he
    
    Not like Ruby's `chomp`, this method will remove **ALL** the occurance of `separator`. If `""`(empty string) is specified as separator, then nothing will do.
    
    - parameter sepatator: User specified characters or nil, which will use the `\r`, `\r\n` or `\n` whoever comes first as the new line character.
    - returns: Returns a string with last new line character removed.
    */
    // FIXME: Endless cycle in scrub.
    public func chomp(_ separator: String? = nil) -> String {
        func scrub(_ separator: String) -> String {
            if separator.count == 0 { return self }
            var e = endIndex
            while self[startIndex..<e].hasSuffix(separator) && endIndex > startIndex {
                e = index(endIndex, offsetBy: String.IndexDistance(-1 * separator.count))
            }
            return String(self[startIndex..<e])
        }

        if let separator = separator {
            return scrub(separator)
        } else if hasSuffix("\r\n") {
            return scrub("\r\n")
        } else if hasSuffix("\n") {
            return scrub("\n")
        } else if hasSuffix("\r") {
            return scrub("\r")
        } else {
            return self
        }
    }

    /**
    Chop off the last character from a string and return it. The original string is not changed.
     
    - returns: A string with the last character removed.
    */
    func chop() -> String {
        var result = self
        let lastCharIndex = index(endIndex, offsetBy: -1)
        let range = lastCharIndex ..< endIndex
        result.removeSubrange(range)
        return result
    }

    /**
     Chop off the last character from the original string and return it. 
     
     @returns The string with last character removed.
    */
    mutating func chopInPlace() -> String {
        self = chop()
        return self
    }

    /**
     Clear out a string, after clear, the original string become an empty string.
    */
    mutating func clear() {
        self = ""
    }

    // chr, chomp!, chop!,  are not implemented

    // codepoints not implemented, since String has better solutions

    /**
    Concat the an object to a string. But unlike Ruby, the object is an `Int`, it will not convert it to Unicode charactor, but convert the `Int` to `String` and concat it to the left hand size string.

    - parameter obj: Any type of object that `String` initializer can handle.
    - returns: A string with original string and an object contact to it.
    */
    func concat<T>(_ obj: T) -> String {
        return self << obj
    }

    // crypt not implemented
    #if !os(Linux)
    /**
    Letters that are shared in a string array are removed from the original string and return. Original string is not changed.
    
    - parameter words: A list of strings. 
    - returns: String with common letters in a string array are removed.
    */
    func delete(_ words: [String]) -> String {
        if words.count == 0 { return self }
        var charset = CharacterSet(charactersIn: words[0])
        if words.count >= 2 {
            for i in 1..<words.count {
                let s = CharacterSet(charactersIn: words[i])
                charset.formIntersection(s)
            }
        }
        let components = self.components(separatedBy: charset)
        var result = ""
        for component in components {
            result += component
        }
        return result
    }
    // Not like ruby's delete!, this method does not return.
    /**
    Remove letters that are shared in a string array from the original string.
    
    - parameter words: A list of strings.
    */
    mutating func deleteInPlace(_ words: [String]) {
        self = delete(words)
    }

    #endif

    /**
     An alias for `lowercaseString`.
    */
    func downcase() -> String {
        return lowercased()
    }

    /**
     Make the string downcase. Original string is changed.
    */
    mutating func downcaseInPlace() {
        self = lowercased()
    }

    // dump not implemented

    // each_byte, each_codepoint not implemented
    /**
    Enumerate all the characters from a string and execute a closure on the characters.
    
    - parameter body: A closure that accept a `Character` as argument.
    */
    func eachChar(_ body: ((Character) -> Void)) {
        forEach(body)
    }

    #if !os(Linux)
    /**
    Emumerate all lines in a string and execute a closure on the lines.
     
    - parameter body: A closure that accept a line of string as argument.
    */
    func eachLine(_ body: ((String) -> Void)) {
        let lines = components(separatedBy: CharacterSet.newlines)
        for line in lines {
            body(line)
        }
    }
    #endif

    /**
     An alias to `isEmpty` property. Since ? can not be used in the property name, this is basically useless.
    */
    var empty: Bool {
        return isEmpty
    }

    #if !os(Linux)
    /**
     Convert a string from one encoding to another encoding. 
     
     - parameter toEncoding: Encoding that the string is converting to.
     - parameter fromEncodding: Original string's encoding. Default value is `NSUTF8StringEncoding`. 
     - returns: A string with destination character encoding. Or `nil` if convert failed.
    */
    func encode(_ toEncoding: String.Encoding, fromEncoding: String.Encoding = String.Encoding.utf8) -> String? {
        guard let data = data(using: fromEncoding) else { return nil }
        let result = String(data: data, encoding: toEncoding)
        return result
    }

    #endif

    // encoding is not applicable; encode!, get_byte not implemented
    // force_encoding is not applicable
    /**
    An alias for `hasSuffix`.
    */
    func endWith(_ suffix: String) -> Bool {
        return hasSuffix(suffix)
    }

    /**
     Substitude all occurance of substrings matching regular expression pattern with the replacement string. If regular expression pattern is illegal or no matching found in the string, the original string will be returned. Original string is not changed.
     
     - parameter pattern: A regular expression pattern. 
     - parameter replacement: The replacement string that will be applied. 
     - returns: A new string with all occurance of patterns replaced.
    */
    #if !os(Linux)
    func gsub(_ pattern:String, replacement:String) -> String {
        var result = self
        result = gsub(pattern) { (match) in
            return replacement
        }
        return result
    }
    #endif
    // Not good...replace from reverse to avoid range change...
    /**
    Substitude all occurance of substrings matching regular expression pattern with the string that was returned by the closure. If regular expression pattern is illegal or no matching found in the string, the original string will be returned. Original string is not changed.

    - parameter pattern: A regular expression pattern.
    - parameter invocation: A closure accecpt an `NSTextCheckingResult` argument and return a string.
    - returns: A new string with all occurance of patterns replaced.
    */
    #if !os(Linux)
    func gsub(_ pattern:String, _ invocation:( (_: NSTextCheckingResult) -> String )) -> String {
        var result = self
        guard let matches = allMatches(pattern)  else { return self }
        (0..<matches.count).reversed().forEach {
            let match = matches[$0]
            if let range = result.range(fromNSRange: match.range) {
                result.replaceSubrange(range, with: invocation(match))
            }
        }
        return result
    }
    #endif

    #if os(Linux)
    public func hasPrefix(str: String) -> Bool {
        let prefix = String(characters.prefix(str.characters.count))
        return prefix == str
    }

    public func hasSuffix(str: String) -> Bool {
        let suffix = String(characters.suffix(str.characters.count))
        return suffix == str
    }

    // hasPrefix2 and hasSuffix2 are copied from Swift Package Manager.
    public func hasPrefix2(str: String) -> Bool {
        if utf8.count < str.utf8.count {
            return false
        }
        for i in 0..<str.utf8.count {
            if utf8[utf8.startIndex.advancedBy(i)] != str.utf8[str.utf8.startIndex.advancedBy(i)] {
                return false
            }
        }
        return true
    }

    public func hasSuffix2(str: String) -> Bool {
        let count = utf8.count
        let strCount = str.utf8.count
        if count < strCount {
            return false
        }
        for i in 0..<str.utf8.count {
            if utf8[utf8.startIndex.advancedBy(count-i-1)] != str.utf8[str.utf8.startIndex.advancedBy(strCount-i-1)] {
                return false
            }
        }
        return true
    }
    #endif

    #if !os(Linux)
    // gsub! not implemented
    // hash is already implemented by standard library
    // hex not implemented

    /**
    Alias for method `containsString`.
    */
    func include(_ subString: String) -> Bool {
        return contains(subString)
    }

    // FIXME: Anyway to make regex and reverse search working together?
    /**
    Get the first index of a substring, or a substring that matches a regular expression pattern.
    
    - parameter subString: If `isRegex` is `false`, `subString` is used as-is while searching for sub string. If `isRegex` is `true`, subString is used as regular expression pattern. 
    - parameter isRegex: Specify use regular expression search or not. 
    - parameter isReverse: Search from the end of the string. If `isRegex` is true, this argument is always `false`. 
    - parameter offset: Specify an offset to start search. 
    - returns: Index of the first occurance of a string or a pattern. If not found, return `nil`.
    */
    func index(_ subString: String, isRegex: Bool = false, isReverse: Bool = false,  offset: Int = 0) -> Int? {
        let searchOffset = (count + offset) % count
        let searchRange = index(startIndex, offsetBy: searchOffset) ..< endIndex
        var options: NSString.CompareOptions = isReverse ? [.backwards] : []
        if isRegex { options = [.regularExpression] }
        guard let range = range(of: subString, options:options, range: searchRange, locale: nil) else { return nil }
        return distance(from: startIndex, to: range.lowerBound)
    }

    #endif

    /**
     Insert the a string into the original string at specific index. Original string is changed. If the index is out of bound of a string, an exception will occured and will crash your app.

     - parameter index: The index to insert the sub string. Type of index is `Int`. 
     - parameter subString: The substring to insert. 
     - returns: Returned the string with sub string inserted.
    */
    mutating func insert(_ pos: Int, _ subString: String) -> String {
        let offset = pos > 0 ? pos : count + pos + 1
        let idx = index(startIndex, offsetBy: offset)
        insert(contentsOf: subString, at: idx)
        return self
    }

    // inspect is not implemented
    // intern is not applicaable

    /**
    An alias for `String.characters.count`.
    */
    var length: Int {
        return count
    }

    #if !os(Linux)
    /**
     Get an array of lines that was contained in the original string. 
     
     - returns: String array contains all lines in a string.
    */
    func lines() -> [String] {
        return components(separatedBy: CharacterSet.newlines)
    }

    #endif
    /**
     Put a string at left most of a longer string and pad the other spaces with padding string. 
     
     - parameter totalLength: The total length of the target string. 
     - parameter padString: The padding string to fill the target string.
     - returns: Returns a new string with the original string at left and other spaces filled with padding string.
    */
    func ljust(_ totalLength:Int, padString: String = " ") -> String {
        if totalLength <= count {
            return self
        }
        else {
            var result = self
            let padSize = padString.count
            for i in 0..<(totalLength - count) {
                result += padString[i % padSize] ?? ""
            }
            return result
        }
    }

    #if !os(Linux)
    /**
     Remove all the white space characters at the left end of the string.
     
     - returns: A new string with white spaces at the left end removed.
    */
    func lstrip() -> String {
        var result = self
        guard let range = range(of: "^\\s+", options: [.regularExpression, .anchored], range: nil) else { return self }
        result.replaceSubrange(range, with: "")
        return result
    }
    
    // Not like ruby, this method will not return
    /**
    Remove all the white space characters at the left end of the original string. Original string is changed.
    */
    mutating func lstripInPlace() {
        self = lstrip()
    }

    /**
     Found the last match of a pattern from a specified offset.
     
     - parameter pattern: A regular expression pattern. 
     - parameter offset: Search offset.
     - parameter invocation: Execute a closure if the pattern is found.
     - returns: Last found pattern's `NSTextCheckingResult`, or `nil` if nothing found.
    */
    func lastMatch(_ pattern:String, offset: Int = 0, _ invocation:((NSTextCheckingResult) -> Void)? = nil) -> NSTextCheckingResult? {
        let m = self.allMatches(pattern, offset: offset)?.last
        if m != nil { invocation?(m!) }
        return m
    }

    /**
     Found all matches of a pattern from a specified offset. 
     
     - parameter pattern: A regular expression pattern. 
     - parameter offset: Search offset.
     - returns: An array of found result in the form of `NSTextCheckingResult`, or `nil` if nothing found.
    */
    func allMatches(_ pattern:String, offset: Int = 0) -> [NSTextCheckingResult]? {
        let searchOffset = (count + offset) % count
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }
        return regex.matches(in: self, options: [], range: NSRange(location: searchOffset, length: count - searchOffset))
    }

    /**
     Found the first match of a pattern from a specified offset.

     - parameter pattern: A regular expression pattern.
     - parameter offset: Search offset.
     - parameter invocation: Execute a closure if the pattern is found.
     - returns: First found pattern's `NSTextCheckingResult`, or `nil` if nothing found.
     */
    func match(_ pattern:String, offset: Int = 0, _ invocation:((NSTextCheckingResult) -> Void)? = nil) -> NSTextCheckingResult? {
        let m = self.allMatches(pattern, offset: offset)?.first
        if m != nil { invocation?(m!) }
        return m
    }

    // next/succ, oct, ord not implemented
    /**
    Partition a string with the first occurance of a sub string or matches a regular expression.
    
    - parameter pattern: A regular expression pattern or a sub string.
    - parameter isRegex: If regular expression is specified, `isReverse` has no effect.
    - parameter isReverse: Search from the end of a string.
    - returns: An array contains first part of a string, substring that matches a pattern, and the remain part of the string. If nothing found, an array contains the original string and two empty string is returned.
    */
    func partition(_ pattern: String, isRegex: Bool = false, isReverse: Bool = false) -> [String] {
        var options: NSString.CompareOptions = isReverse ? [.backwards] : []
        if isRegex { options = [.regularExpression] }
        guard let range = range(of: pattern, options: options, range: nil, locale: nil) else { return [self, "", ""] }
        let rangeBefore = startIndex ..< range.lowerBound
        let rangeAfter = range.upperBound ..< endIndex
        return [String(self[rangeBefore]), String(self[range]), String(self[rangeAfter])]
    }
    #endif
    /**
     Add a prefix to a string. Original string is not changed.
     
     - parameter prefix: String prefix. 
     - returns: String with a prefix and the original string.
    */
    func prepend(_ prefix: String) -> String {
        return prefix + self
    }

    /**
     Replace the current string with another string.
     
     - parameter anotherString: A string. 
     - returns: The value of `anotherString` argument.
    */
    mutating func replace(_ anotherString: String) -> String {
        self = anotherString
        return self
    }


    /**
     Reverse all the characters in a string.
     
     - returns: The reversed string.
    */
    func reverse() -> String {
        return String(self.reversed())
    }

    /**
     Change the original string to a string of all the characters reversed.
     
     - returns: The reversed string.
    */
    mutating func reverseInPlace() -> String {
        self = reverse()
        return self
    }
    
    #if !os(Linux)
    // The implementation is done in index()
    // Due we use rangeOfString for implementation, 
    // currently regex search from backword is not supported
    // so we disable it, for now.
    /**
    Return the last index of a substring. Currently regular expression search is not supported. 
    
    - parameter subString: The sub string to found. 
    - parameter offset: Search offset. 
    - returns: Return the index of the target sub string. If not found, returns `nil`.
    */
    func rindex(_ subString: String, offset: Int = 0) -> Int? {  //FIXME: isRegex: Bool = false, removed from method signature
        return index(subString, isRegex: false, isReverse:true, offset: offset)
    }
    #endif
    /**
     Put a string at right most of a longer string and pad the other spaces with padding string.

     - parameter totalLength: The total length of the target string.
     - parameter padString: The padding string to fill the target string.
     - returns: Returns a new string with the original string at right and other spaces filled with padding string.
     */
    func rjust(_ totalLength: Int, padString: String = " ") -> String {
        let stringLength = count
        if totalLength <= stringLength {
            return self
        }
        else {
            var result = ""
            let padSize = padString.count
            for i in 0..<(totalLength - stringLength) {
                result += padString[i % padSize] ?? ""
            }
            result += self
            return result
        }
    }

    #if !os(Linux)
    // Same reason as rindex
    /**
    Partition a string with the last occurance of a sub string or matches a regular expression. Currently regular expression search is not supported.

    - parameter pattern: A regular expression pattern or a sub string.
    - returns: An array contains first part of a string, last substring that matches a pattern, and the remain part of the string. If nothing found, an array contains the original string and two empty string is returned.
    */
    func rpartition(_ pattern: String) -> [String] {//FIXME: isRegex: Bool = false, removed from method signature
        return partition(pattern, isRegex: false, isReverse: true)
    }

    /**
     Remove all the white space characters at the right end of the string.

     - returns: A new string with white spaces at the right end removed.
     */
    func rstrip() -> String {
        var result = self
        guard let range = range(of: "\\s+$", options: [.regularExpression], range: nil) else { return self }
        result.replaceSubrange(range, with: "")
        return result
    }

    // Not like ruby, this method will not return
    /**
    Remove all the white space characters at the right end of the original string. Original string is changed.
    */
    mutating func rstripInPlace() {
        self = rstrip()
    }

    /**
     Scan for a regular expression pattern and execute a closure with the founc result as the argument.
     
     - parameter pattern: A regular expression pattern. 
     - parameter invocation: A closure that accept the scan result as argument. 
     - returns: Returns a search result array, or `nil` if pattern not found.
    */
    func scan(_ pattern:String, _ invocation:((NSTextCheckingResult) -> Void)? = nil) -> [NSTextCheckingResult]? {
        guard let matches = allMatches(pattern) else { return nil }
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
    
    #endif

    // scrub, scrub!, setByte not implemented
    /**
    Alias for `String.characters.count`.
    */
    var size: Int {
        return count
    }

    #if !os(Linux)
    // slice is not implemented, maybe implemented later, part of the functionalities are implemented by subsctipt
    
    // the limit argument is not implemented.
    // now split() and split("") mimic ruby behavior, not componentsSeparatedByString behavior.
    /**
    Split a string by a sub string or regular expression. If the sub string to split a string is `nil`, returns an array contains the original string; If the sub string is an empty string `""`, an array contains every single character as a string is returned. For example:
    
        "hello".split() // returns: ["hello"]
        "hello".split("") // returns: ["h", "e", "l", "l", "o"]
        "hello".split("l+", isRegex: true) // returns: ["he", "o"]
    
    - parameter seperator: The sub string to seperate a longer string. If `isRegex` is `true`, `seperator` is used as a regular expression pattern. 
    - parameter isRegex: Use regular expression search or not. 
    - returns: An array contains every single character as a string is returned.
    */
    func split(_ seperator: String? = nil, isRegex: Bool = false) -> [String] {
        if seperator == nil { return [self] }
        if isRegex {
            let __UUID = String.UUIDString()
            let tmpString = replacingOccurrences(of: seperator!, with: __UUID, options: [.regularExpression], range: nil)
            return tmpString.components(separatedBy: __UUID)
        }
        else {
            if seperator == "" {
                return map { String($0) }
            }
            else {
                return components(separatedBy: seperator!)
            }
        }
    }

    /**
     Squeeze all the continous white spaces into one space. Original string is not changed. e.g.
     
        "   Hello   world!   ".squeeze() // returns: " Hello world! "
     
     - returns: A new string with all continous white spaces condenced into one.
    */
    func squeeze() -> String {
        let result = gsub("\\s+", replacement: " ")
        print(result)
        return result
    }

    /**
     Squeeze all the continous white spaces into one space from the original string.

     - returns: A new string with all continous white spaces condenced into one.
     */
    mutating func squeezeInPlace() -> String {
        self = squeeze()
        return self
    }

    #endif

    /**
     Alias to `hasPrefix` method.
     
     On Linux platform this is not. Since standard library does not implement `hasPrefix` yet. I copied `hasPrefix` implementation code from Swift Package Manager, but I think this `startWith` implementation is better than `hasPrefix`.
    */
    func startWith(_ prefix: String) -> Bool {
        #if os(Linux)
        return self.characters.startsWith(prefix.characters)
        #else
        return hasPrefix(prefix)
        #endif
    }

    #if !os(Linux)
    // white space and new line chars are all stripped
    // note: lstrip and rstrip are not trim newline chars
    // this behavior may change later
    /**
    Delete white space and new line characters from both end of a string. Original string is not changed.
    
    - returns: A new string with white space and new line characters remove from both end of the original string.
    */
    func strip() -> String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    /**
     Delete white space and new line characters from both end of the original string.

     - returns: The string with white space and new line characters remove from both end of the original string.
     */
    mutating func stripInPlace() -> String {
        self = strip()
        return self
    }

    /**
     Replace first match of a regular expression pattern with the result of execusion of a closure.
     
     - parameter pattern: A regular expression pattern.
     - parameter invocation: A parameter process the found result and return a string to replace. 
     - return: A string with the first matched pattern replaced.
    */
    func sub(_ pattern:String, _ invocation:( (_: NSTextCheckingResult) -> String )) -> String {
        var result = self
        guard let match = match(pattern), let range = result.range(fromNSRange: match.range) else { return self }
        result.replaceSubrange(range, with: invocation(match))
        return result
    }

    #endif

    #if !os(Linux)
    /**
     Replace the first match of a regular expression pattern with the target replacement string.

     - parameter pattern: A regular expression.
     - parameter replacement: The replacement string.
     - return: A string with the first matched pattern replaced.
    */
    func sub(_ pattern:String, replacement:String) -> String {
        var result = self
        result = sub(pattern) { (match) in
            return replacement
        }
        return result
    }
    
    #endif

    // succ, succ!, sum to_xxx unpack upto not implemented
    //TODO: swapcase(), swapcaseInPlace()
    //  tr and tr! not implemented. Maybe add later

    /**
    Alias for `uppercaseString` property.
    */
    func upcase() -> String {
        return uppercased()
    }

    /**
     Make the original string an upper cased string.
    */
    mutating func upcaseInPlace() {
        self = uppercased()
    }

    #if !os(Linux)
    // not functions the same as the ruby's valid_encoding?
    /**
    Evaluate a string whether it can be converted to a specified string encoding.
    
    - returns: If convertable returns `true`, else returns `false`.
    */
    func validEncoding(_ encoding: String.Encoding) -> Bool {
        guard let _ = data(using: encoding, allowLossyConversion: false) else { return false }
        return true
    }
    #endif
}
