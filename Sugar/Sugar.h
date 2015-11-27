//
//  Sugar_OSX.h
//  Sugar_OSX
//
//  Created by 朱文杰 on 15/11/27.
//  Copyright © 2015年 朱文杰. All rights reserved.
//

#if TARGET_OS_IPHONE || TARGET_OS_TV
#import <UIKit/UIKit.h>
#elif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

//! Project version number for Sugar_OSX.
FOUNDATION_EXPORT double Sugar_OSXVersionNumber;

//! Project version string for Sugar_OSX.
FOUNDATION_EXPORT const unsigned char Sugar_OSXVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Sugar_OSX/PublicHeader.h>


