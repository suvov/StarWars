//
//  StarWarsService.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

private typealias ServiceProtocols = FilmsServiceProtocol

// MARK: Service

final class StarWarsService: ServiceProtocols {
  private let apiClient = URLSessionAPIClient<StarWarsEndpoint>()

  func getFilms() -> AnyPublisher<FilmsResponse, Error> {
    apiClient.request(.getFilms)
  }
}

// MARK: Endpoint

private enum StarWarsEndpoint: APIEndpoint {
  case getFilms

  var baseURL: URL {
    URL(string: "https://swapi.dev/api")!
  }

  var path: String {
    switch self {
    case .getFilms:
      return "/films"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .getFilms:
      return .get
    }
  }
}
