//
//  String+Regex.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//
#if !os(Linux)

import Foundation

@available(iOS 7.0, OSX 10.9, *)
public extension String {
    /**
     Determine whether a string matches regular expression.
    */
    func matches(_ pattern: String, regularExpressionOptions:NSRegularExpression.Options = [.caseInsensitive], matchingOptions:NSRegularExpression.MatchingOptions = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: regularExpressionOptions) else { return false }
        let nsRange = NSRange(location: 0, length: self.count)
        if regex.numberOfMatches(in: self, options: matchingOptions, range:nsRange) > 0 {
            return true
        }
        else {
            return false
        }
    }

    /**
     Array of regular expression captures.
    */
    func arrayOfCaptureComponentsMatchedByRegex(_ pattern: String) -> [[String]] {
        var result: [[String]] = [[]]
        guard let regex = try? NSRegularExpression(pattern: pattern, options:[.caseInsensitive]) else { return result }
        let nsRange = NSRange(location: 0, length: count)
        let matches = regex.matches(in: self, options: [], range: nsRange)
        for match in matches {
            var subResult: [String] = []
            for i in 0..<match.numberOfRanges {
                let nsRange = match.range(at: i)
                subResult.append(self[nsRange] ?? "")
            }
            if !subResult.isEmpty { result.append(subResult) }
        }
        return result
    }

    /**
     Matched sub strings captured by a regular expression.
    */
    func captureComponentsMatchedByRegex(_ pattern: String, capture captureIndex: Int = 1) -> [String] {
        let matches = self.arrayOfCaptureComponentsMatchedByRegex(pattern)
        var result: [String] = []
        for match in matches {
            guard captureIndex < match.count else { return result } // Make sure index not beyond length
            result.append(match[captureIndex])
        }
        return result
    }

    /**
     The exact matched sub string captured by a regular expression.
     */
    func stringByMatching(_ pattern: String, capture captureIndex: Int = 1) -> String? {
        let matches = self.arrayOfCaptureComponentsMatchedByRegex(pattern)
        var result: String? = nil
        for match in matches {
            guard captureIndex < match.count else { continue } // Make sure index not beyond length
            result = match[captureIndex]
            break
        }
        return result
    }
}

#endif
