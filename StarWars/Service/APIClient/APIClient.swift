//
//  APIClient.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol APIEndpoint {
  var baseURL: URL { get }
  var path: String { get }
  var method: HTTPMethod { get }
}

enum HTTPMethod: String {
  case get = "GET"
}

protocol APIClient {
  associatedtype EndpointType: APIEndpoint
  func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
