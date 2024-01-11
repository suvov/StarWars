//
//  FilmDetailServiceMock.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation
@testable import StarWars

struct FilmsDetailServiceMock: FilmDetailServiceProtocol {
  private let filmDetailResponse: FilmDetailResponse
  private let error: Error?
  
  init(_ filmDetailResponse: FilmDetailResponse, _ error: Error? = nil) {
    self.filmDetailResponse = filmDetailResponse
    self.error = error
  }

  func getFilmDetail(filmId: Int) -> AnyPublisher<FilmDetailResponse, Error> {
    if let error {
      return Fail(error: error).eraseToAnyPublisher()
    }
    return Just(filmDetailResponse)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
