//
//  AppDelegate.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  private lazy var appCoordinator: AppCoordinator = {
    let serviceFactory = ServiceFactory()
    let moduleFactory = ModuleFactory(serviceFactory: serviceFactory)
    let coordinatorFactory = CoordinatorFactory(
      serviceFactory: serviceFactory,
      moduleFactory: moduleFactory
    )
    return coordinatorFactory.makeApp(window: window!)
  }()

  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    appCoordinator.start()
    return true
  }
}
