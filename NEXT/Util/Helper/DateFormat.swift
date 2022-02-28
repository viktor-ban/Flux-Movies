//
//  DateFormat.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

enum DateFormat {
    /// Format type: yyyy-MM-dd
    case yyyyMMdd
    
    /// Format type: yyyy-MM-dd HH:mm
    case yyyyMMddHHmmss
    
    /// Format type: yyyy-MM-dd'T'HH:mm:ss.SSSZ
    case yyyyMMddTHHmmssSSSZ
    
    /// Format type: yyyy-MM-dd'T'HH:mm:ss.SSSzzzz
    case yyyyMMddTHHmmssSSSzzzz
    
    /// Format type: yyyy-MM-dd'T'HH:mm:ss.SSS
    case yyyyMMddTHHmmssSSS
}

extension DateFormat {
    
    var stringRepresentation: String {
        switch self {
        case .yyyyMMdd:
            return "yyyy-MM-dd"
        case .yyyyMMddHHmmss:
            return "yyyy-MM-dd HH:mm:ss"
        case .yyyyMMddTHHmmssSSS:
            return "yyyy-MM-dd'T'HH:mm:ss.SSS"
        case .yyyyMMddTHHmmssSSSZ:
            return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case .yyyyMMddTHHmmssSSSzzzz:
            return "yyyy-MM-dd'T'HH:mm:ss.SSSzzzz"
        }
    }
}
