//
//  ServiceFactory.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

final class ServiceFactory {
  private lazy var starWarsNetworkService = StarWarsNetworkService()

  var filmsService: FilmsServiceProtocol {
    starWarsNetworkService
  }

  var filmDetailService: FilmDetailServiceProtocol {
    starWarsNetworkService
  }
}
