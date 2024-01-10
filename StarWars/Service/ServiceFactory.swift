//
//  ServiceFactory.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

final class ServiceFactory {
  private lazy var starWarsService = StarWarsService()

  var filmsService: FilmsServiceProtocol {
    starWarsService
  }

  var filmDetailService: FilmDetailServiceProtocol {
    starWarsService
  }
}
