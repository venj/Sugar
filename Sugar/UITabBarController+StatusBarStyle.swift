//
//  UITabBarController+StatusBarStyle.swift
//  Video Player
//
//  Created by 朱文杰 on 15/11/10.
//  Copyright © 2015年 Home. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
public extension UITabBarController {
    /**
     Override the default `UITabBarController`'s `preferedStatusBarStyle, make it reflecting the selected view controller's `preferredStatusBarStyle`.

     - returns: A UIStatusBarStyle key indicating your preferred status bar style for the view controller.
     */
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        guard selectedViewController != nil else { return .Default }
        return selectedViewController!.preferredStatusBarStyle()
    }
}
