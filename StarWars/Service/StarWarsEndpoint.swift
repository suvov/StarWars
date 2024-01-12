//
//  StarWarsEndpoint.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import Foundation

enum StarWarsEndpoint: APIEndpointProtocol {
  case getFilms
  case getFilmDetail(filmId: Int)

  var baseURL: URL? {
    URL(string: "https://swapi.dev/api")
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
