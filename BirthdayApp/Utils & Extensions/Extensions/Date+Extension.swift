//
//  Date+Extension.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation
extension Date {
    static func localizeDateFrom(dateString: String) -> String {
        // Cast string to date
       // 2022-06-02T22:00:00
    //1981-11-24T13:17:42.515Z
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

}
