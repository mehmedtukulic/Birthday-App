//
//  FeedResponse.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

struct FeedResponse: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let name: Name
    let dob: Dob
    
    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }

    struct Dob: Decodable {
        let date: String
        let age: Int
    }
}

