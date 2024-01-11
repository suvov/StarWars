//
//  FimListItemView+Equatable.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation
@testable import StarWars

extension FilmListItemView.Model: Equatable {
  static public func ==(lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id && lhs.title == rhs.title
  }
}
