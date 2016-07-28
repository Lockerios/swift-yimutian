//
//  Constant.swift
//  SportsStore
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension String {
    
    func stringByAppendingPathComponent(_ path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathComponent(path)
    }
}

//MARK: Screen

let SCREEN_BOUNDS = UIScreen.main().bounds
let SCREEN_SCALE = UIScreen.main().scale
let SCREEN_WIDTH = UIScreen.main().bounds.size.width
let SCREEN_HEIGHT = UIScreen.main().bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

//MARK: Device

let IS_IPAD = UIDevice.current().userInterfaceIdiom == UIUserInterfaceIdiom.pad
let IS_IPHONE = UIDevice.current().userInterfaceIdiom == UIUserInterfaceIdiom.phone

let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//MARK: System Version

let IS_OS_7_OR_LATER = (UIDevice.current().systemVersion as String).floatValue >= 7.0
let IS_OS_8_OR_LATER = (UIDevice.current().systemVersion as String).floatValue >= 8.0
let IS_OS_9_OR_LATER = (UIDevice.current().systemVersion as String).floatValue >= 9.0

//MARK: Macros

/** 
dLog macros to abbreviate NSLog.
    
Use like this:

dLog("Log this!")
**/

#if DEBUG
    func dLog( message:  @autoclosure () -> String, filename: String = #file, function: String = #function, line: Int = #line) {
        NSLog("[\(filename.stringByAppendingPathComponent):\(line)] \(function) - %@", message())
    }
#else
    func dLog( message:  @autoclosure () -> String, filename: String = #file, function: String = #function, line: Int = #line) {
        
    }
#endif
