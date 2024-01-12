//
//  APIClientProtocol.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol APIClientProtocol {
  associatedtype EndpointType: APIEndpointProtocol
  func request(_ endpoint: EndpointType) -> AnyPublisher<Data, Error>
}
