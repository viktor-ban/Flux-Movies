//
//  DateHelper.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

class DateHelper {
    
    static func getDayNameDateForOrder(date: String) -> String {
        let date = date.toDate(format: DateFormat.yyyyMMddTHHmmssSSS)
        let dateFormatterPrint = DateFormatter.dayNameWithDate
        return dateFormatterPrint.string(from: date)
    }
    
    static func getDayNameDate(date: String) -> String {
        let dateFormatterGet = DateFormatter.iso8601
        let dateFormatterPrint = DateFormatter.dayNameWithDate
        let date = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: date ?? Date())
    }

    static func getOrderingListDayNameDate(date: String) -> String {
        let dateFormatterGet = DateFormatter.iso8601WitoutTZ
        let dateFormatterPrint = DateFormatter.dayNameWithDate
        let date = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: date ?? Date())
    }
    
    static func getDayNameDateToday() -> String {
        let dateFormatterGet = DateFormatter.iso8601
        let dateFormatterPrint = DateFormatter.dayNameWithDate
        let dateString = dateFormatterGet.string(from: Date())
        let date = dateFormatterGet.date(from: dateString)
        return dateFormatterPrint.string(from: date ?? Date())
    }
    
    static func getNavBarDate(date: Date) -> String {
        let dateFormatterGet = DateFormatter.iso8601
        let dateFormatterPrint = DateFormatter.monthNameWithDay
        let finalDate = dateFormatterGet.string(from: date)
        guard let stringDate = dateFormatterGet.date(from: finalDate) else {return ""}
        return dateFormatterPrint.string(from: stringDate)
    }

    static func getServerDate(date: Date) -> String {
        let dateFormatterGet = DateFormatter.iso8601
        let dateFormatterPrint = DateFormatter.dashedDate
        
        let finalDate = dateFormatterGet.string(from: date)
        guard let stringDate = dateFormatterGet.date(from: finalDate) else {return ""}
        return dateFormatterPrint.string(from: stringDate)
    }
}
