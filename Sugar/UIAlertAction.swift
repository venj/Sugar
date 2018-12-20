//
//  U.swift
//  Sugar
//
//  Created by Venj on 16/2/19.
//  Copyright © 2016年 Venj. All rights reserved.
//
#if !os(Linux)
import UIKit

@available(iOS 7.0, *)
public extension UIAlertAction {
    /**
     Generate a cancel action without the hassle to write `UIAlertAction(...)` again and again.
     
     - parameter handler: Optional hander argument to do some cancel action. 
     - returns: UIAlertAction object which represents cancel action.
     */
    class func cancelAction(_ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: NSLocalizedString("Cancel", comment:"Cancel Action Title"), style: .cancel, handler: handler)
    }
}
#endif
