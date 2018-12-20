//
//  Int+FileSize.swift
//  Sugar
//
//  Created by Venj on 15/11/2.
//  Copyright © 2015年 Home. All rights reserved.
//

import Foundation

@available(iOS 8.0, OSX 10.10, *)
public extension Int {
    /// Convert size number into human readable size string. Largest size unit is `GB`.
    var fileSizeString: String {
        var str = ""
        if Int64(self) > 1.gb {
            str = String(format: "%.1f GB", arguments: [Double(self) / Double(1.gb)])
        }
        else if Int64(self) > 1.mb {
            str = String(format: "%.1f MB", arguments: [Double(self) / Double(1.mb)])
        }
        else if Int64(self) > 1.kb {
            str = String(format: "%.1f KB", arguments: [Double(self) / Double(1.kb)])
        }
        else {
            str = String(format: "%.1f B", arguments: [Double(self)])
        }
        return str
    }
}

public extension Int64 {
    /// Convert size number into human readable size string. Largest size unit is `GB`.
    var fileSizeString: String {
        var str = ""
        if self > Int64(1.gb) {
            str = String(format: "%.1f GB", arguments: [Double(self) / Double(1.gb)])
        }
        else if self > Int64(1.mb) {
            str = String(format: "%.1f MB", arguments: [Double(self) / Double(1.mb)])
        }
        else if self > Int64(1.kb) {
            str = String(format: "%.1f KB", arguments: [Double(self) / Double(1.kb)])
        }
        else {
            str = String(format: "%.1f B", arguments: [Double(self)])
        }
        return str
    }
}
