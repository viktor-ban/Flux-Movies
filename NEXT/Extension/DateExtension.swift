//
//  DateExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

extension Date {
    func stringIn(format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.stringRepresentation
        formatter.locale = Locale.autoupdatingCurrent
        return formatter.string(from: self)
    }
}
