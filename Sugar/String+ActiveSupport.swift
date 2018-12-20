//
//  String+ActiveSupport.swift
//  Sugar
//
//  Created by Venj on 15/11/19.
//  Copyright © 2015年 Venj. All rights reserved.
//
/**
Active Support flavored extension for String.
*/
@available(iOS 8.0, OSX 10.10, *)
public extension String {
    /**
     Get the character at a specified position in integer. Negtive value is the position count from the end.
     
     - parameter position: Position in int. Position can be negtive. 
     - returns: The character at the specified position as a `String` object.
    */
    func at(_ position: Int) -> String? {
        return self[position]
    }

    /**
     Get the character at a specified position in `String.CharacterView.Index`.

     - parameter position: Position in `String.CharacterView.Index`.
     - returns: The character at the specified position as a `String` object.
    */
    func at(_ index: Index) -> String {
        return String(self[index])
    }

    /**
     Get sub string at a specified closed integer range.

     - parameter range: Closed Int range.
     - returns: Sub string at the specified range.
     */
    func at(_ range: ClosedRange<Int>) -> String? {
        return self[range]
    }

    /**
     Get sub string at a specified integer range.

     - parameter range: Int range.
     - returns: Sub string at the specified range.
    */
    func at(_ range: Range<Int>) -> String? {
        return self[range]
    }

    /**
     Get sub string at a specified range in `Range<Index>`.

     - parameter range: Range in the form of Range<Index>.
     - returns: Sub string at the specified range.
     */
    func at(_ range: Range<Index>) -> String {
        return String(self[range])
    }


    /**
     Get sub string at a specified range in `ClosedRange<Index>`.

     - parameter range: Closed Range in the form of Range<Index>.
     - returns: Sub string at the specified range.
     */
    func at(_ range: ClosedRange<Index>) -> String {
        return String(self[range])
    }

    #if !os(Linux)

    /**
     Find the first substring matching a specified regular expression pattern.

     - parameter pattern: Regular expression pattern.
     - returns: First matched sub string.
    */
    func at(_ pattern: String) -> String? {
        guard let range = match(pattern)?.range else { return nil }
        return self[range]
    }

    /**
     Examines whether the string does not contains certain sub string.
     
     - parameter subString: A string. 
     - returns: A boolean.
    */
    func exclude(_ subString: String) -> Bool {
        return !include(subString)
    }
    
    #endif

    /**
     Get the first several characters of the string. 
     
     - parameter length: Number of characters to get. 
     - returns: First several characters of the string.
    */
    func first(_ length:Int = 1) -> String {
        if length <= 0 { return "" }
        if length >= count { return self }
        else { return self[0..<length] ?? "" }
    }

    /**
     Get the last several characters of the string.

     - parameter length: Number of characters to get.
     - returns: Last several characters of the string.
     */
    func last(_ length:Int = 1) -> String {
        if length <= 0 { return "" }
        if length >= count { return self }
        else { return self [(count - length)..<count] ?? "" }
    }

    #if !os(Linux)
    /**
     Remove all occurances of sub string matches a regular expression pattern.

     - parameter pattern: A regular expression pattern.
     - returns: A new string with all matched sub string removed.
     */
    func remove(_ pattern: String) -> String {
        return gsub(pattern, replacement: "")
    }

    /**
     Remove all occurances of sub string matches a regular expression pattern from the original string.

     - parameter pattern: A regular expression pattern.
     - returns: The string with all matched sub string removed.
     */
    mutating func removeInPlace(_ pattern: String) -> String {
        self = gsub(pattern, replacement: "")
        return self
    }

    /**
     Squish multiple white spaces into one. 
     
     - returns: A new string with white space squished.
    */
    func squish() -> String {
        var result = self
        result = result.strip().gsub("[[:space:]]+", replacement: " ")
        return result
    }

    /**
     Squish multiple white spaces into one in the original string.

     - returns: The string with white space squished.
     */
    mutating func squishInPlace() -> String {
        self = squish()
        return self
    }

    #endif
}
