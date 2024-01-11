//
//  ModuleFactory.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

final class ModuleFactory {
  init(serviceFactory: ServiceFactory) {
    self.serviceFactory = serviceFactory
  }

  let serviceFactory: ServiceFactory
}
