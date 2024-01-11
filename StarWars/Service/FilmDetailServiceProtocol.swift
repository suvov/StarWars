//
//  FilmDetailServiceProtocol.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import Foundation

protocol FilmDetailServiceProtocol {
  func getFilmDetail(filmId: Int) -> AnyPublisher<FilmDetailResponse, Error>
}
