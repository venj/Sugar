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

     - parameter body: A closure accept current index as argument.
     */
    func times(_ body: ((_ index: Int64) -> Void)) {
        for i in 0..<self {
            body(i)
        }
    }
}
