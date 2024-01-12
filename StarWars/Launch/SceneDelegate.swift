//
//  SceneDelegate.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  private var appCoordinator: BaseCoordinator?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    self.appCoordinator = Self.makeAppCoordinator(window)
    window.makeKeyAndVisible()
    appCoordinator?.start()
  }
}

private extension SceneDelegate {
  static func makeAppCoordinator(_ window: UIWindow) -> AppCoordinator {
    let serviceFactory = ServiceFactory()
    let moduleFactory = ModuleFactory(serviceFactory: serviceFactory)
    let coordinatorFactory = CoordinatorFactory(
      serviceFactory: serviceFactory,
      moduleFactory: moduleFactory
    )
    return coordinatorFactory.makeApp(window: window)
  }
}
