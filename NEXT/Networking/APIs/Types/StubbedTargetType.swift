//
//  StubbedTargetType.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 25..
//  Copyright © 2017. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

protocol StubbedTargetType {

    /// Stub settings
    /// - nil, if stub not enabld
    /// - 0, if immediate stub response enabled
    /// - x > 0, if stub response enabled with x seconds delay
    var stubWithDelay: TimeInterval? { get }
}
