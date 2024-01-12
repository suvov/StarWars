//
//  StarWarsAPIClientProtocol.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import Combine
import Foundation

protocol StarWarsAPIClientProtocol {
  func request(_ endpoint: StarWarsEndpoint) -> AnyPublisher<Data, Error>
}

extension URLSessionAPIClient<StarWarsEndpoint>: StarWarsAPIClientProtocol {}
