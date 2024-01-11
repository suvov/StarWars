//
//  FilmListCoordinator.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import UIKit

extension FilmListCoordinator {
  struct Dependency {
    let navigationController: UINavigationController
    let coordinatorFactory: CoordinatorFactory
    let moduleFactory: ModuleFactory
  }
}

final class FilmListCoordinator: BaseCoordinator {
  private let dependency: Dependency
  private var subscriptions = Set<AnyCancellable>()

  init(dependency: Dependency) {
    self.dependency = dependency
  }

  override func start() {
    let module = dependency.moduleFactory.makeFilmList()

    dependency.navigationController
      .setViewControllers([module.vc], animated: false)

    module.output.sink { [unowned self] output in
      switch output {
      case let .selectFilmWithId(id, title):
        self.showFilmDetail(filmId: id, filmTitle: title)
      case .deinited:
        self.onFinish?(self)
      }
    }
    .store(in: &subscriptions)
  }

  private func showFilmDetail(filmId: Int, filmTitle: String) {
    let coordinator = dependency
      .coordinatorFactory
      .makeFilmDetail(
        navigationController: dependency.navigationController,
        filmId: filmId, filmTitle: filmTitle
      )
    attachChild(coordinator)
    coordinator.start()
  }

  deinit {
    print("💀 \(type(of: self)) dead")
  }
}
