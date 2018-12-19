//
//  NSCharacterSet+URLEncode.swift
//  Sugar
//
//  Created by 朱文杰 on 16/5/18.
//  Copyright © 2016年 朱文杰. All rights reserved.
//

import Foundation

extension CharacterSet {
    static func formURLEncodeSafeCharacterSet() {
        return NSMutableCharacterSet.alphanumeric().addCharacters(in: "-_.!~*'()")
    }
}
