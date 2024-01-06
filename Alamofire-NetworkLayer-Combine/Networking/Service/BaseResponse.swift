//
//  BaseResponse.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//
import Foundation


struct BaseResponse<T: Codable>: Codable {
    var status: Int?
    let message: String?
    var data: T?



    enum Codingkeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
    }
}
