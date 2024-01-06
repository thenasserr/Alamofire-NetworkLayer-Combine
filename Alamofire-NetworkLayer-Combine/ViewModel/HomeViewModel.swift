//
//  HomeViewModel.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import Foundation
import Combine

final class HomeViewModel {

  @Published var categories: [Category] = []
  var cancellable = Set<AnyCancellable>()

  func getCategories() {
    CategoriesAPI.shared.getCategories()
      .map({$0?.data})
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {

        case .finished:
          ()
        case .failure(let error):
          print(error.localizedDescription)
        }
      } receiveValue: { [weak self] data in
        self?.categories = data?.categories ?? []
        print(self?.categories)
      }.store(in: &cancellable)

  }
}
