//
//  FilmListLoadingView.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

struct FilmListLoadingView: View {
  var body: some View {
    FilmListView(model: .placeholder,
                 onEvent: { _ in })
      .redacted(reason: .placeholder)
      .disabled(true)
  }
}

extension FilmListView.Model {
  static var placeholder: Self {
    let items = (0 ... 6).map {
      FilmListItemView.Model(id: $0, title: "Placeholder")
    }
    return FilmListView.Model(items: items)
  }
}

// MARK: - Preview

#if DEBUG
  #Preview {
    FilmListLoadingView()
  }
#endif
