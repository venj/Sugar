//
//  DOuble+Ruby.swift
//  Sugar
//
//  Created by Venj on 15/11/16.
//  Copyright © 2015年 Venj. All rights reserved.
//
/**
 Ruby core flavored extension for `Double`.
*/
@available(iOS 8.0, OSX 10.10, *)
public extension Double {
    /**
     Get the absolute value of a `Double` value.
     */
    func abs() -> Double {
        return self >= 0 ? self : -self
    }
}
 
