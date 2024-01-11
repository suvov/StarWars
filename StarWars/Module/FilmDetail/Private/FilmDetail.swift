//
//  FilmDetail.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

enum FilmDetail {
  enum Event {
    case load
  }

  enum State {
    case loading
    case loaded(FilmDetailView.Model)
    case error(String)
  }
}
