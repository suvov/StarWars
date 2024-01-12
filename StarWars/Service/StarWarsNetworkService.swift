//
//  StarWarsNetworkService.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

private typealias ServiceProtocols = FilmDetailServiceProtocol
  & FilmsServiceProtocol

// MARK: Service

final class StarWarsNetworkService: ServiceProtocols {
  private let starWarsAPIClient: StarWarsAPIClientProtocol

  init(starWarsAPIClient: StarWarsAPIClientProtocol = URLSessionAPIClient()) {
    self.starWarsAPIClient = starWarsAPIClient
  }

  func getFilms() -> AnyPublisher<FilmsResponse, Error> {
    starWarsAPIClient.request(.getFilms)
      .tryMap { data in
        try StarWarsJSONDecoder
          .decode(FilmsResponse.self, from: data)
      }
      .eraseToAnyPublisher()
  }

  func getFilmDetail(filmId: Int) -> AnyPublisher<FilmDetailResponse, Error> {
    starWarsAPIClient.request(.getFilmDetail(filmId: filmId))
      .tryMap { data in
        try StarWarsJSONDecoder
          .decode(FilmDetailResponse.self, from: data)
      }
      .eraseToAnyPublisher()
  }
}
