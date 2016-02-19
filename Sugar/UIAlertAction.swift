//
//  U.swift
//  Sugar
//
//  Created by 朱文杰 on 16/2/19.
//  Copyright © 2016年 朱文杰. All rights reserved.
//

import UIKit

extension UIAlertAction {
    /**
     Generate a cancel action without the hassle to write `UIAlertAction(...)` again and again.
     
     - parameter handler: Optional hander argument to do some cancel action. 
     - returns: UIAlertAction object which represents cancel action.
     */
    class func cancelAction(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: NSLocalizedString("Cancel", comment:"Cancel Action Title"), style: .Cancel, handler: handler)
    }
}
