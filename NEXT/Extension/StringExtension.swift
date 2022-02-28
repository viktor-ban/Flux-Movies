//
//  NSAttributedStringExtension.swift
//  NAV-eFIP
//
//  Created by Ban_Viktor on 2022. 02. 04..
//

import Foundation
import UIKit

extension String {
    
    func toDate(from format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.stringRepresentation
        return dateFormatter.date(from: self)
    }
    
}
