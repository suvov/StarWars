//
//  FilmList+Adapter.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

extension FilmList {
  enum Adapter {
    static func adaptFilmsResponse(_ filmsResponse: FilmsResponse) -> FilmListView.Model {
      let items = filmsResponse.results
        .enumerated()
        .map { index, item in
          FilmListItemView.Model(id: index + 1, title: item.title)
        }
      return FilmListView.Model(items: items)
    }

    static func adaptError(_ error: Error) -> String {
      if error.localizedDescription.isEmpty {
        return "Unknown error"
      }
      return "Error loading films: \(error.localizedDescription)"
    }
  }
}
