//
//  Random.swift
//  Yimutian
//
//  Created by yangyang on 15/11/2.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import Foundation

func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}