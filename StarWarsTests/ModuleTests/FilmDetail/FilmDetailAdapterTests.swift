//
//  FilmDetailAdapterTests.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import XCTest
@testable import StarWars

final class FilmDetailAdapterTests: XCTestCase {
  func testAdaptFilmDetailResponseIntoDetailModel() {
    // Given
    let filmDetailResponse = FilmDetailResponse.stub()
    
    // When
    let filmDetailModel = FilmDetail.Adapter
        .adaptFilmDetailResponse(filmDetailResponse)
   
    // Then
    let episodeId = filmDetailResponse.episodeId
    let openingCrawl = filmDetailResponse.openingCrawl
    let releaseDate = filmDetailResponse.releaseDate
    
    let expectedFilmDetailModel = FilmDetailView.Model(
        episodeId: "\(episodeId)",
        releaseDate: releaseDate.formatted(date: .abbreviated, time: .omitted),
        openingCrawl: openingCrawl
    )
    XCTAssertEqual(
      filmDetailModel, expectedFilmDetailModel,
      "Adapted film detail view model not equal to expected."
    )
  }
}

