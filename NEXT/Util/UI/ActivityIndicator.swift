//
//  ActivityIndicator.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

/**
 
 # Activity Indicator
 Default newtork (and other loading) indicator dialog inside status bar.
 
 */
class ActivityIndicator {

    static var cntr = 0

    // MARK: - Application network activity indicator

    /**
     Push indicator into status bar. If more than one pushed, indicator is visible.
     */
    class func pushIndicator() {
        self.cntr += 1
        updateIndicator()
    }

    /**
     Pop indicator from status bar. If all popped or no one pushed, then idicator is invisible.
     */
    class func popIndicator() {
        self.cntr -= 1
        if self.cntr < 0 {
            self.cntr = 0
        }
        self.updateIndicator()
    }

    // MARK: - Private function

    class fileprivate func updateIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = (self.cntr > 0)
    }

}
