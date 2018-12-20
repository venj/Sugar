//
//  UIAlertController+Sugar.swift
//  Sugar Example
//
//  Created by Venj on 15/11/24.
//  Copyright © 2015年 Venj. All rights reserved.
//
#if !os(Linux)
import UIKit

public extension UIAlertController {
    /**
     Add multiple `UIAlertAction`s at the same time.
     
     - parameter actions: An array of actions.
    */
    func addActions(_ actions: [UIAlertAction]) {
        actions.forEach(addAction)
    }
}
#endif
