//
//  FilmDetail+Screen.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

extension FilmDetail {
  struct Screen<VM: FilmDetailViewModelProtocol>: View {
    @ObservedObject
    var vm: VM

    var body: some View {
      Group {
        switch vm.state {
        case .loading:
          FilmDetailLoadingView()
        case let .loaded(model):
          FilmDetailView(model: model)
        case let .error(text):
          Text(text)
            .foregroundStyle(.secondary)
        }
      }
      .onAppear {
        vm.onEvent(.load)
      }
    }
  }
}

// MARK: - Preview & Stubs

#if DEBUG
  #Preview("Loading") {
    FilmDetail.Screen(vm: FilmDetailViewModelStub(.loading))
  }

  #Preview("Loaded") {
    FilmDetail.Screen(vm: FilmDetailViewModelStub(.loaded(.stub)))
  }

  #Preview("Error") {
    FilmDetail.Screen(vm: FilmDetailViewModelStub(.error("Error...")))
  }

  final class FilmDetailViewModelStub: FilmDetailViewModelProtocol {
    init(_ state: FilmDetail.State = .loaded(.stub)) {
      self.state = state
    }

    let state: FilmDetail.State
    func onEvent(_: FilmDetail.Event) {}
  }
#endif
