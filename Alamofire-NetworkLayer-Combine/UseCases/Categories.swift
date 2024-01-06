//
//  Categories.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import Foundation
import Combine



class CategoriesAPI : BaseAPI<CategoriesNetworking> {

  static let shared = CategoriesAPI()
  
  func getCategories() -> AnyPublisher<BaseResponse<AllDishes>?, APIError> {
     fetchData(target: .getCategory, responseClass: BaseResponse<AllDishes>.self)
  }
  
}

