//
//  StarWarsService.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

private typealias ServiceProtocols = FilmDetailServiceProtocol
  & FilmsServiceProtocol

// MARK: Service

final class StarWarsService: ServiceProtocols {
  private let apiClient = URLSessionAPIClient<StarWarsEndpoint>()

  func getFilms() -> AnyPublisher<FilmsResponse, Error> {
    apiClient.request(.getFilms)
  }

  func getFilmDetail(filmId: Int) -> AnyPublisher<FilmDetailResponse, Error> {
    apiClient.request(.getFilmDetail(filmId: filmId))
  }
}

// MARK: Endpoint

private enum StarWarsEndpoint: APIEndpoint {
  case getFilms
  case getFilmDetail(filmId: Int)

  var baseURL: URL {
    URL(string: "https://swapi.dev/api")!
  }

  var path: String {
    switch self {
    case .getFilms:
      return "/films"
    case let .getFilmDetail(filmId):
      return "/films/\(filmId)"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .getFilms, .getFilmDetail:
      return .get
    }
  }
}
