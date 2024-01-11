//
//  FilmList+ViewModel.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol FilmListViewModelProtocol: ObservableObject {
  var state: FilmList.State { get }
  func onEvent(_ event: FilmList.Event)
}

extension FilmList {
  final class ViewModel: FilmListViewModelProtocol {
    private let filmsService: FilmsServiceProtocol
    private let outputSubject = PassthroughSubject<FilmListOutput, Never>()
    private var subscriptions = Set<AnyCancellable>()

    init(filmsService: FilmsServiceProtocol) {
      self.filmsService = filmsService
    }

    @Published
    var state: State = .loading

    func onEvent(_ event: Event) {
      switch event {
      case .load:
        loadFilms()
      case let .select(itemModel):
        outputSubject.send(
          .selectFilmWithId(id: itemModel.id, title: itemModel.title)
        )
      }
    }

    var output: AnyPublisher<FilmListOutput, Never> {
      outputSubject.eraseToAnyPublisher()
    }

    private func loadFilms() {
      filmsService.getFilms()
        .map {
          State.loaded(Adapter.adaptFilmsResponse($0))
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
