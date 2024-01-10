//
//  AppCoordinator.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import UIKit

extension AppCoordinator {
  struct Dependency {
    let window: UIWindow
    let coordinatorFactory: CoordinatorFactory
    let moduleFactory: ModuleFactory
  }
}

final class AppCoordinator: BaseCoordinator {
  private let dp: Dependency

  init(dependency: Dependency) {
    dp = dependency
    super.init()
  }

  override func start() {
    let navigationController = UINavigationController()
    dp.window.rootViewController = navigationController
    let coordinator = dp.coordinatorFactory
      .makeFilmList(navigationController: navigationController)
    attachChild(coordinator)
    coordinator.start()
  }

  deinit {
    print("💀 \(type(of: self)) dead")
  }
}
