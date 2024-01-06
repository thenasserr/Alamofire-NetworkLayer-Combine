//
//  Dishes.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Resaults: Codable {
    let data: AllDishes
}

// MARK: - DataClass
struct AllDishes: Codable {
    let categories: [Category]
    let populars, specials: [Popular]
}

// MARK: - Category
struct Category: Codable {
    let id, title: String
    let image: String
}

// MARK: - Popular
struct Popular: Codable {
    let id, name, description: String
    let image: String
    let calories: Int
}
