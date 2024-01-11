//
//  FilmListItemView.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

struct FilmListItemView: View {
  let model: Model

  var body: some View {
    HStack {
      Text(model.title)
      Spacer()
      Image(systemName: "chevron.right")
    }
    .foregroundColor(.primary)
  }
}

// MARK: - Model

extension FilmListItemView {
  struct Model {
    let id: Int
    let title: String
  }
}

// MARK: - Preview & Stubs

#if DEBUG
  #Preview {
    FilmListItemView(model: .stub(0))
  }

  extension FilmListItemView.Model {
    static func stub(_ id: Int) -> Self {
      .init(id: id, title: "Item-\(id)")
    }
  }
#endif
