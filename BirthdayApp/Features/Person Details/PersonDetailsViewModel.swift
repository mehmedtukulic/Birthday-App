//
//  PersonDetailsViewModel.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

struct PersonDetailsViewModel {
    let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var personInitials: String {
        "\(person.name.first.prefix(1))" + "\(person.name.last.prefix(1))"
    }
    
    var personName: String {
        "\(person.name.first) \(person.name.last)"
    }
    
    var formattedDate: Date {
        let formatter = DateFormatter.iso8601Formater
        if let decodedDate = formatter.date(from: person.dob.date) {
            return decodedDate
        } else {
            return Date()
        }
    }
    
    var personYears: String {
        let currentDate = Date()
        let differenceBetweenDates = currentDate.years(from: formattedDate)
        return "\(differenceBetweenDates) years old"
    }
}
