//
//  String+Linux.swift
//  Sugar
//
//  Created by 朱文杰 on 15/11/3.
//  Copyright © 2015年 Home. All rights reserved.
//

#if os(Linux)
extension String {
    func substringWithRange(range: Range<Index>) -> String {
        return self[range]
    }
}
#endif
