//
//  URLSessionAPIClient.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

final class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
  private let jsonDecoder: JSONDecoder

  init(jsonDecoder: JSONDecoder) {
    self.jsonDecoder = jsonDecoder
  }

  func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
    guard let baseURL = endpoint.baseURL else {
      return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
    }
    let url = baseURL.appendingPathComponent(endpoint.path)
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue

    return URLSession.shared.dataTaskPublisher(for: request)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .tryMap { [unowned self] data, response -> T in
        guard
          (response as? HTTPURLResponse)?.statusCode == 200
        else {
          throw APIError.invalidResponse
        }
        do {
          return try self.jsonDecoder.decode(T.self, from: data)
        } catch {
          throw APIError.invalidData
        }
      }
      .eraseToAnyPublisher()
  }
}
