//
//  URLSessionAPIClient.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

final class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
  func request(_ endpoint: EndpointType) -> AnyPublisher<Data, Error> {
    guard let baseURL = endpoint.baseURL else {
      return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
    }
    let url = baseURL.appendingPathComponent(endpoint.path)
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue

    return URLSession.shared.dataTaskPublisher(for: request)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .tryMap { data, response in
        guard
          (response as? HTTPURLResponse)?.statusCode == 200
        else {
          throw APIError.invalidResponse
        }
        return data
      }
      .eraseToAnyPublisher()
  }
}
