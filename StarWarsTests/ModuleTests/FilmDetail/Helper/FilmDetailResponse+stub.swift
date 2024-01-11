//
//  FilmDetailResponse+stub.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmDetailResponse {
  static func stub(episodeId: Int = 1,
                   openingCrawl: String = "",
                   releaseDate: Date = Date(timeIntervalSince1970: 0)
  ) -> Self {
    FilmDetailResponse(
      episodeId: episodeId,
      openingCrawl: openingCrawl,
      releaseDate: releaseDate
    )
  }
}
