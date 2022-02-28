//
//  FirstStartHelper.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

/// # FirstStartHelper
/// Check if application running for the first time on device since last install.
class FirstStartHelper {

    fileprivate static let isNotFirstStartKey = "isNotFirstStart"

    class var isFirstStart: Bool {
        get {
            return !UserDefaults.standard.bool(forKey: isNotFirstStartKey)
        }
        set(newValue) {
            return UserDefaults.standard.set(!newValue, forKey: isNotFirstStartKey)
        }
    }

}
