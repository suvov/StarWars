//
//  FilmDetailCoordinator.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import UIKit

extension FilmDetailCoordinator {
  struct Dependency {
    let navigationController: UINavigationController
    let moduleFactory: ModuleFactory
    let filmId: Int
    let filmTitle: String
  }
}

final class FilmDetailCoordinator: BaseCoordinator {
  private let dp: Dependency
  private var subscriptions = Set<AnyCancellable>()

  init(dependency: Dependency) {
    dp = dependency
  }

  override func start() {
    let module = dp.moduleFactory
      .makeFilmDetail(filmId: dp.filmId, filmTitle: dp.filmTitle)
    dp.navigationController.pushViewController(module.vc, animated: true)

    module.output.sink { [unowned self] output in
      switch output {
      case .deinited:
        self.onFinish?(self)
      }
    }
    .store(in: &subscriptions)
  }

  deinit {
    print("💀 \(type(of: self)) deinited")
  }
}
