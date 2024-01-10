//
//  FilmListView.Model+Equatable.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmListView.Model: Equatable {
  static public func ==(lhs: Self, rhs: Self) -> Bool {
    lhs.items == rhs.items
  }
}
