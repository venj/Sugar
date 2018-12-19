//
//  UITabBarController+StatusBarStyle.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/10.
//  Copyright © 2015年 Home. All rights reserved.
//
#if !os(Linux)
import UIKit

@available(iOS 7.0, *)
extension UITabBarController {
    /**
     Override the default `UITabBarController`'s `preferedStatusBarStyle, make it reflecting the selected view controller's `preferredStatusBarStyle`.

     - returns: A UIStatusBarStyle key indicating your preferred status bar style for the view controller.
     */

    override open var preferredStatusBarStyle : UIStatusBarStyle {
        guard selectedViewController != nil else { return .default }
        return selectedViewController!.preferredStatusBarStyle
    }
}
#endif
