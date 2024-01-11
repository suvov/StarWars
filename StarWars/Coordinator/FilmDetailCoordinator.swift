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
  private let dependency: Dependency
  private var subscriptions = Set<AnyCancellable>()

  init(dependency: Dependency) {
    self.dependency = dependency
  }

  override func start() {
    let module = dependency.moduleFactory
      .makeFilmDetail(filmId: dependency.filmId, filmTitle: dependency.filmTitle)
    
    dependency.navigationController.pushViewController(module.vc, animated: true)
    
    module.output.sink { [unowned self] output in
      switch output {
      case .deinited:
        self.onFinish?(self)
      }
    }
    .store(in: &subscriptions)
  }

  deinit {
    print("💀 \(type(of: self)) dead")
  }
}
