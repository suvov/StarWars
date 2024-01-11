//
//  FilmDetailLoadingView.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

struct FilmDetailLoadingView: View {
  var body: some View {
    ProgressView()
  }
}

// MARK: - Preview

#if DEBUG
  #Preview {
    FilmDetailLoadingView()
  }
#endif
