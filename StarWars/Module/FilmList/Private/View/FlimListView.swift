//
//  FlimListView.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

struct FilmListView: View {
  let model: Model
  let onEvent: (FilmList.Event) -> Void

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 8) {
        ForEach(model.items, id: \.id) { item in
          Button(action: {
            onEvent(.select(item))
          }, label: {
            FilmListItemView(model: item)
              .frame(minHeight: 44)
          })
        }
      }
      .padding(.horizontal, 16)
    }
  }
}

// MARK: - Model

extension FilmListView {
  struct Model {
    let items: [FilmListItemView.Model]
  }
}

// MARK: - Preview & Stubs

#if DEBUG
  #Preview {
    FilmListView(model: .stub, onEvent: { _ in })
  }

  extension FilmListView.Model {
    static var stub: Self {
      .init(items: (0 ... 10).map { .stub($0) })
    }
  }
#endif
