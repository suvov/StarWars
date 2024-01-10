//
//  CoordinatorFactory.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import UIKit

final class CoordinatorFactory {
  private let serviceFactory: ServiceFactory
  private let moduleFactory: ModuleFactory

  init(serviceFactory: ServiceFactory,
       moduleFactory: ModuleFactory)
  {
    self.serviceFactory = serviceFactory
    self.moduleFactory = moduleFactory
  }

  // MARK: App

  func makeApp(window: UIWindow) -> AppCoordinator {
    let dependency = AppCoordinator.Dependency(
      window: window,
      coordinatorFactory: self,
      moduleFactory: moduleFactory
    )
    return AppCoordinator(dependency: dependency)
  }

  // MARK: Film list

  func makeFilmList(
    navigationController: UINavigationController
  ) -> FilmListCoordinator {
    FilmListCoordinator(
      dependency: FilmListCoordinator.Dependency(
        navigationController: navigationController,
        coordinatorFactory: self,
        moduleFactory: moduleFactory
      )
    )
  }
}
