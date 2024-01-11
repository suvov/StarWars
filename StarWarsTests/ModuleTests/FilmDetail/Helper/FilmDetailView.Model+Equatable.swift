//
//  FilmDetailView.Model+Equatable.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmDetailView.Model: Equatable {
  static public func ==(lhs: Self, rhs: Self) -> Bool {
    lhs.episodeId == rhs.episodeId &&
    lhs.openingCrawl == rhs.openingCrawl &&
    lhs.releaseDate == rhs.releaseDate
  }
}
