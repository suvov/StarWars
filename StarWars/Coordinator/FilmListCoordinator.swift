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
  private let dp: Dependency
  private var subscriptions = Set<AnyCancellable>()

  init(dependency: Dependency) {
    self.dp = dependency
  }

  override func start() {
    let module = dp.moduleFactory.makeFilmList()
    dp.navigationController
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

  private func showFilmDetail(filmId _: Int, filmTitle _: String) {}

  deinit {
    print("💀 \(type(of: self)) dead")
  }
}
