//
//  Int64+Ruby.swift
//  Sugar
//
//  Created by Venj on 15/12/13.
//  Copyright © 2015年 Venj. All rights reserved.
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
