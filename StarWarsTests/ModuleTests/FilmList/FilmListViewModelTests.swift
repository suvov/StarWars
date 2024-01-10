//
//  FilmListViewModelTests.swift
//  StarWarsTests
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import XCTest
import Combine
@testable import StarWars

final class FilmListViewModelTests: XCTestCase {
  private var subscriptions = Set<AnyCancellable>()

  override func setUpWithError() throws {
    subscriptions = []
  }
  
  func testInitialStateIsLoading() throws {
    // Given
    let filmsResponse = FilmsResponse.generateStub(0)
    let filmsService = FilmsServiceMock(filmsResponse)
    
    // When
    let vm = FilmList.ViewModel(filmsService: filmsService)

    // Then
    XCTAssertTrue(
      vm.state == .loading,
      "Expected initial state to be .loading, but got \(vm.state)."
    )
  }
  
  func testLoadsFilmsAfterLoadEvent() throws {
    // Given
    let filmsCount = 3
    let filmsResponse = FilmsResponse.generateStub(filmsCount)
    let filmsService = FilmsServiceMock(filmsResponse)
    let vm = FilmList.ViewModel(filmsService: filmsService)
    let expectation = XCTestExpectation(description: "Loaded \(filmsCount) films.")

    vm.$state
      .dropFirst() // drop .loading
      .sink(receiveValue: { state in
        switch state {
        case .loaded(let model):
          XCTAssertEqual(
            model.items.count, filmsCount,
            "Expected state to be \(filmsCount), but got \(model.items.count)."
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
  
  func testEmitsSelectOutputAfterSelectEvent() {
    // Given
    let filmsResponse = FilmsResponse.generateStub(1)
    let filmListModel = FilmList.Adapter.adaptFilmsResponse(filmsResponse)
    let firstFilm = filmListModel.items[0]
    let filmsService = FilmsServiceMock(filmsResponse)
    let vm = FilmList.ViewModel(filmsService: filmsService)
    let expectation = XCTestExpectation(description: "Emitted selection.")
    
    vm.output
      .first() // drop .deinited
      .sink { output in
        switch output {
        case let .selectFilmWithId(id, title):
          XCTAssertEqual(firstFilm.id, id)
          XCTAssertEqual(firstFilm.title, title)
        default:
          XCTFail("Expected select output, but got \(output).")
        }
        expectation.fulfill()
      }
    .store(in: &subscriptions)
    
    // When
    vm.onEvent(.select(firstFilm))
    
    //Then
    wait(for: [expectation], timeout: 1)
  }
  
  func testEmitsDeinitedOutputAfterRelease() {
    // Given
    let filmsResponse = FilmsResponse.generateStub(0)
    let filmsService = FilmsServiceMock(filmsResponse)
    var vm: FilmList.ViewModel? = FilmList.ViewModel(
      filmsService: filmsService
    )
    let expectation = XCTestExpectation(description: "Emitted deinit.")

    vm?.output
      .sink { output in
        switch output {
        case .deinited:
          break
        default:
          XCTFail("Expected select output, but got \(output).")
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
