//
//  BaseAPI.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import Foundation
import Alamofire
import Combine

class BaseAPI<T: TargetType> {

    typealias AnyPublisherResult<M> = AnyPublisher<M?, APIError>
    typealias FutureResult<M> = Future<M?, APIError>

    /// ```
    /// Generic Base Class + Combine Concept + Future Promise
    ///
    /// ```
    ///
    /// - Returns: `etc promise(.failure(.timeout)) || promise(.success(value))`.
    ///

    func fetchData<M: Decodable>(target: T, responseClass: M.Type) -> AnyPublisherResult<M> {

        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameters(task: target.task)
      let targetPath = target.path
      let url = (target.baseURL + targetPath)

        return FutureResult<M> { [weak self] promise in

            AF.request(url, method: method, parameters: params.0, encoding: params.1, headers: headers, requestModifier: { $0.timeoutInterval = 20 })
                .validate(statusCode: 200..<300)
                .responseDecodable(of: M.self) { response in

                    switch response.result {

                    case .success(let value):

                        promise(.success(value))

                    case .failure(let error):
                        guard !error.isTimeout else {return promise(.failure(.timeout)) }
                        guard !error.isConnectedToTheInternet else { return promise(.failure(.noNetwork)) }
                        return promise(.failure(.general))
                    }
                }
        }
        .eraseToAnyPublisher()
    }

  func buildParameters(task: Task) -> ([String:Any], ParameterEncoding) {
      switch task {
      case .requestPlain:
          return ([:], URLEncoding.default)
      case .requestParameters(parameters: let parameters, encoding: let encoding):
          return (parameters, encoding)
      }
  }

}

