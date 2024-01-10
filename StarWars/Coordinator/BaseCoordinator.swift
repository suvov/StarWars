//
//  BaseCoordinator.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

class BaseCoordinator {
  private(set) var children: [BaseCoordinator] = []

  /// Coordinator should call this when its view is dismissed.
  var onFinish: ((BaseCoordinator) -> Void)?

  func start() {
    assertionFailure("Please override")
  }

  func attachChild(_ coordinator: BaseCoordinator) {
    if children.contains(where: { $0 === coordinator }) {
      assertionFailure("Trying to attach coordinator twice.")
      return
    }
    coordinator.onFinish = { [unowned self] in
      self.detachChild($0)
    }
    children.append(coordinator)
  }

  private func detachChild(_ coordinator: BaseCoordinator) {
    if children.isEmpty {
      return
    }
    if let index = children.firstIndex(
      where: { $0 === coordinator }
    ) {
      children.remove(at: index)
    } else {
      assertionFailure()
    }
  }
}
