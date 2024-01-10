//
//  FilmDetail+Adapter.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

extension FilmDetail {
  enum Adapter {
    static func adaptFilmDetailResponse(
      _ filmDetailResponse: FilmDetailResponse
    ) -> FilmDetailView.Model {
      let episodeId = "\(filmDetailResponse.episodeId)"
      let releaseDate = filmDetailResponse.releaseDate
        .formatted(date: .abbreviated, time: .omitted)
      let openingCrawl = filmDetailResponse.openingCrawl
      return FilmDetailView.Model(
        episodeId: episodeId,
        releaseDate: releaseDate,
        openingCrawl: openingCrawl
      )
    }

    static func adaptError(_ error: Error) -> String {
      if error.localizedDescription.isEmpty {
        return "Unknown error"
      }
      return "Error loading film: \(error.localizedDescription)"
    }
  }
}
