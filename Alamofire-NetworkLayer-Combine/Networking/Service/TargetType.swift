//
//  TargetType.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import Foundation
import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestType : Equatable {
    /// A request with no additional data.
    case requestPath(path : String)
    /// A request with query param
    case queryParametrs(query : String)
}

enum Task {

    /// A request with no additional data.
    case requestPlain

    /// A requests body set with encoded parameters.
    case requestParameters(parameters: [String: Any], encoding: JSONEncoding)
}

protocol TargetType {

    /// The target's base `URL`.
    var baseURL: String { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The type of HTTP task to be performed.
    var task: Task { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}
