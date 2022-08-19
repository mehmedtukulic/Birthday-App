//
//  ApiParameters.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

public typealias JSON = [String: Any]

protocol APIRequest {
    var url: String { get }
    var headers: JSON{ get }
    var parameters: JSON? { get }
    var method: HTTPMethod { get }
}

enum HTTPMethod: String{
    case GET
    case POST
    case PUT
    case DELETE
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json; charset=UTF-8"
}

