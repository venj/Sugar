//
//  UINavigationController+StatusBarStyle.swift
//  Video Player
//
//  Created by Venj on 15/11/6.
//  Copyright © 2015年 Home. All rights reserved.
//
#if !os(Linux)
import UIKit

@available(iOS 7.0, *)
extension UINavigationController {
    /**
     Override the default `UINavigationController`'s `preferedStatusBarStyle, make it reflecting the child view controller's `preferredStatusBarStyle`. 
     
     When presented in modal, use `presentingViewController`'s status bar style.
     
     - returns: A UIStatusBarStyle key indicating your preferred status bar style for the view controller.
    */
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        if presentingViewController != nil {
            // When being presented, presentingViewController should always not nil.
            return presentingViewController!.preferredStatusBarStyle
        }
        else {
            guard topViewController != nil else { return .default }
            return topViewController!.preferredStatusBarStyle
        }
    }
}
#endif
