//
//  FilmList.State+Equatable.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmList.State: Equatable {
  static public func ==(lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
      true
    case (.error(let lhsError), .error(let rhsError)):
      lhsError == rhsError
    case (.loaded(let lhsModel), .loaded(let rhsModel)):
      lhsModel == rhsModel
    default:
      false
    }
  }
}
