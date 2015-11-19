//
//  Int+ActiveSupport.swift
//  Sugar Example
//
//  Created by 朱文杰 on 15/11/19.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

// Notice for 32-bit: Following code may overflow on 32-bit platform
@available(iOS 7.0, OSX 10.9, *)
extension Int {
    var kilobytes: Int {
        return 1024
    }

    var megabytes: Int {
        return 1024 * kilobytes
    }

    var gigabytes: Int {
        return 1024 * megabytes
    }

    var terabytes: Int {
        return 1024 * gigabytes
    }

    var petabytes: Int {
        return 1024 * terabytes
    }

    var exabytes: Int {
        return 1024 * petabytes
    }

    var eb: Int {
        return exabytes
    }

    var pb: Int {
        return petabytes
    }

    var tb: Int {
        return terabytes
    }

    var gb: Int {
        return gigabytes
    }

    var mb: Int {
        return megabytes
    }

    var kb: Int {
        return kilobytes
    }


}