//
//  FilmListAdapterTests.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

import XCTest
@testable import StarWars

final class FilmListAdapterTests: XCTestCase {
  func testAdaptFilmsResponseIntoListModel() {
    // Given
    let filmId = 1
    let filmTitle = "Film"
    let filmsResponse = FilmsResponse(results: [.init(title: filmTitle)])
    
    // When
    let filmListModel = FilmList.Adapter.adaptFilmsResponse(filmsResponse)
   
    // Then
    let expectedFilmListModel = FilmListView.Model(
      items: [
        FilmListItemView.Model(id: filmId, title: filmTitle)
      ]
    )
    XCTAssertEqual(
      filmListModel, expectedFilmListModel,
      "Adapted film list view model not equal to expected."
    )
  }
}
