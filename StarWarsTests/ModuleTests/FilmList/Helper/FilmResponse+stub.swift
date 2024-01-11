//
//  FilmResponse+stub.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmsResponse {
  static func generateStub(_ resultsCount: Int) -> Self {
    let results = (0 ..< resultsCount).map {
      FilmsResponse.Film(title: "\($0)")
    }
    return FilmsResponse(results: results)
  }
}
