//
//  Int64+Ruby.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/12/13.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

import Foundation

extension Int64 {
    /**
     Execute a closure for multiple times.

     - parameter invocation: A closure accept current index as argument.
     */
    func times(_ invocation: ((_ index: Int64) -> Void)) {
        for i in 0..<self {
            invocation(i)
        }
    }
}
