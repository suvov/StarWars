//
//  FilmDetail+ViewModel.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol FilmDetailViewModelProtocol: ObservableObject {
  var state: FilmDetail.State { get }
  func onEvent(_ event: FilmDetail.Event)
}

extension FilmDetail {
  final class ViewModel: FilmDetailViewModelProtocol {
    private let filmDetailService: FilmDetailServiceProtocol
    private let filmId: Int
    private let outputSubject = PassthroughSubject<FilmDetailOutput, Never>()

    private var subscriptions = Set<AnyCancellable>()

    init(filmDetailService: FilmDetailServiceProtocol, filmId: Int) {
      self.filmDetailService = filmDetailService
      self.filmId = filmId
    }

    @Published
    var state: State = .loading

    func onEvent(_ event: Event) {
      switch event {
      case .load:
        loadFilmDetail()
      }
    }

    var output: AnyPublisher<FilmDetailOutput, Never> {
      outputSubject.eraseToAnyPublisher()
    }

    private func loadFilmDetail() {
      filmDetailService.getFilmDetail(filmId: filmId)
        .map {
          State.loaded(Adapter.adaptFilmDetailResponse($0))
        }
        .catch { error in
          Just(State.error(Adapter.adaptError(error)))
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] in
          self?.state = $0
        }
        .store(in: &subscriptions)
    }

    deinit {
      outputSubject.send(.deinited)
      print("💀 \(type(of: self)) dead")
    }
  }
}
