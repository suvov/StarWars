//
//  FilmDetailView.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

struct FilmDetailView: View {
  let model: Model

  var body: some View {
    ScrollView {
      VStack(spacing: 8) {
        Text(model.episodeId)
          .font(.largeTitle)
        Text(model.releaseDate)
          .font(.title3)
        Text(model.openingCrawl)
      }
      .padding(.horizontal, 16)
    }
  }
}

// MARK: - Model

extension FilmDetailView {
  struct Model {
    let episodeId: String
    let releaseDate: String
    let openingCrawl: String
  }
}

// MARK: - Preview & Stubs

#if DEBUG
  #Preview {
    FilmDetailView(model: .stub)
  }

  extension FilmDetailView.Model {
    static var stub: Self {
      .init(
        episodeId: "6",
        releaseDate: "25 May 1983",
        openingCrawl: """
        Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...
        """
      )
    }
  }
#endif
