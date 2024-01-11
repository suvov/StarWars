//
//  FilmList.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

enum FilmList {
  enum Event {
    case load
    case select(FilmListItemView.Model)
  }

  enum State {
    case loading
    case loaded(FilmListView.Model)
    case error(String)
  }

  enum Texts {
    static let navigationTitle = "Films"
  }
}
