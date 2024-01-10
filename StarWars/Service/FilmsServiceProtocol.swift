//
//  FilmsServiceProtocol.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol FilmsServiceProtocol {
  func getFilms() -> AnyPublisher<FilmsResponse, Error>
}
