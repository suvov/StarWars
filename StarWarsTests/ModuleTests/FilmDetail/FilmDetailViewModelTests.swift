//
//  FilmDetailViewModelTests.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import XCTest
import Combine
@testable import StarWars

final class FilmDetailViewModelTests: XCTestCase {
  private var subscriptions = Set<AnyCancellable>()

  override func setUpWithError() throws {
    subscriptions = []
  }
  
  func testInitialStateIsLoading() throws {
    // Given
    let filmDetailResponse = FilmDetailResponse.stub()
    let filmDetailService = FilmsDetailServiceMock(filmDetailResponse)
    
    // When
    let vm = FilmDetail.ViewModel(
      filmDetailService: filmDetailService, filmId: 0
    )

    // Then
    XCTAssertTrue(
      vm.state == .loading,
      "Expected initial state to be .loading, but got \(vm.state)."
    )
  }
  
  func testLoadsFilmDetailAfterLoadEvent() throws {
    // Given
    let filmDetailResponse = FilmDetailResponse.stub()
    let filmDetailService = FilmsDetailServiceMock(filmDetailResponse)
    let vm = FilmDetail.ViewModel(
      filmDetailService: filmDetailService, filmId: 0
    )
    let expectation = XCTestExpectation(description: "Loaded film detail")
    let expectedModel = FilmDetail.Adapter
      .adaptFilmDetailResponse(filmDetailResponse)
    
    vm.$state
      .dropFirst() // drop .loading
      .sink(receiveValue: { state in
        switch state {
        case .loaded(let model):
          XCTAssertEqual(
            model, expectedModel,
            "Model doesn't equal to expected."
          )
        default:
          XCTFail("Expected .loaded state, but got \(state).")
        }
        expectation.fulfill()
      })
      .store(in: &subscriptions)

    //When
    vm.onEvent(.load)

    //Then
    wait(for: [expectation], timeout: 1)
  }
  
  func testEmitsDeinitedOutputAfterRelease() {
    // Given
    let filmDetailResponse = FilmDetailResponse.stub()
    let filmDetailService = FilmsDetailServiceMock(filmDetailResponse)
    var vm: FilmDetail.ViewModel? = FilmDetail.ViewModel(
      filmDetailService: filmDetailService, filmId: 0
    )
    let expectation = XCTestExpectation(description: "Emitted deinit.")

    vm?.output
      .sink { output in
        switch output {
        case .deinited:
          break
        }
        expectation.fulfill()
      }
    .store(in: &subscriptions)
    
    // When
    vm = nil
    
    //Then
    wait(for: [expectation], timeout: 1)
  }
}
