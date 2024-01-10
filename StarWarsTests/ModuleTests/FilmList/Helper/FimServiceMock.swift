//
//  FimServiceMock.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation
@testable import StarWars

struct FilmsServiceMock: FilmsServiceProtocol {
  private let filmsResponse: FilmsResponse
  private let error: Error?
  
  init(_ filmsResponse: FilmsResponse, _ error: Error? = nil) {
    self.filmsResponse = filmsResponse
    self.error = error
  }

  func getFilms() -> AnyPublisher<FilmsResponse, Error> {
    Just(filmsResponse)
      .setFailureType(to: Error.self)
      .tryMap {
        if let error {
          throw error
        } else {
          return $0
        }
      }
      .eraseToAnyPublisher()
  }
}
