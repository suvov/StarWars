//
//  FilmDetail.State+Equatable.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmDetail.State: Equatable {
  static public func ==(lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
      return true
    case (.error(let lhsError), .error(let rhsError)):
      return lhsError == rhsError
    case (.loaded(let lhsModel), .loaded(let rhsModel)):
      return lhsModel == rhsModel
    default:
      return false
    }
  }
}
