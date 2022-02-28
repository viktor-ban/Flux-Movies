//
//  StringHelper.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

class StringHelper {
    static func toCamelCase(string1: String, string2: String) {
        /*let first = NSAttributedString(string: string1, attributes: [NSAttributedString.Key.font: AppTheme.h3Font])
        let second = NSAttributedString(string: string2, attributes: [NSAttributedString.Key.font: AppTheme.h5Font])
        let fullString = NSMutableAttributedString(attributedString: first)
        fullString.append(second)
        return fullString*/
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func toDate(format: DateFormat, timeZone identifier: String? = nil) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format.stringRepresentation
        formatter.locale = Locale.autoupdatingCurrent
        formatter.timeZone = TimeZone(identifier: identifier ?? TimeZone.autoupdatingCurrent.identifier)
        return formatter.date(from: self) ?? Date()
    }
}
