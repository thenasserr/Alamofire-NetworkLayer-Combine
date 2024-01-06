//
//  AFError + Extension.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import Foundation
import Alamofire

extension AFError {

    var isTimeout: Bool {
        if isSessionTaskError,
           let error = underlyingError as NSError?,
           error.code == NSURLErrorTimedOut || error.code == NSURLErrorUnknown {
            return true
        }
        return false
    }

    var isConnectedToTheInternet: Bool {
        if isSessionTaskError,
           let error = underlyingError as NSError?,
           error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorDataNotAllowed {
            return true
        }
        return false
    }
}
