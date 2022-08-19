//
//  Date+Extension.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

extension Date {
    
    static func localizeDateFrom(dateString: String) -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateTimeFormatter.date(from: dateString) ?? Date()
        
        // Cast date to wanted string type
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd/MM/yyyy"
        outputDateFormatter.locale = NSLocale.init(localeIdentifier: "en") as Locale
        let localizedDateString = outputDateFormatter.string(from: date)
        return localizedDateString
    }
    
    
    // Returns the amount of days from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
}

extension DateFormatter {
    static let iso8601Formater: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en")
        return formatter
    }()
}
