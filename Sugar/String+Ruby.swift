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
func %(lhs: String, rhs: [AnyObject]) {
    //TODO: Use va_args to implement
}

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

infix operator << { associativity left precedence 140 }
func <<<T: StringLiteralConvertible>(lhs: String, rhs: T) -> String {
    return lhs + String(rhs)
}
