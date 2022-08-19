//
//  FeedRequests.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

enum FeedRequest: APIRequest {
    case getFeed
    
    var url: String {
        switch self {
        case .getFeed:
            return "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob"
        }
    }
    
    var headers: JSON {
        switch self {
        case .getFeed:
            return [:]
        }
    }
    
    var parameters: JSON? {
        switch self {
        case .getFeed:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFeed:
            return .GET
        }
    }
    
    
}
