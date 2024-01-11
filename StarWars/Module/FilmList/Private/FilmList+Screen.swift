//
//  FilmList+Screen.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import SwiftUI

extension FilmList {
  struct Screen<VM: FilmListViewModelProtocol>: View {
    @ObservedObject
    var vm: VM

    var body: some View {
      Group {
        switch vm.state {
        case .loading:
          FilmListLoadingView()
        case let .loaded(model):
          FilmListView(model: model, onEvent: vm.onEvent(_:))
        case let .error(text):
          Text(text)
            .foregroundStyle(.secondary)
        }
      }
      .navigationTitle(FilmList.Texts.navigationTitle)
      .onAppear {
        vm.onEvent(.load)
      }
    }
  }
}

// MARK: - Preview & Stubs

#if DEBUG
  #Preview("Loading") {
    FilmList.Screen(vm: FilmListViewModelStub(.loading))
  }

  #Preview("Loaded") {
    FilmList.Screen(vm: FilmListViewModelStub(.loaded(.stub)))
  }

  #Preview("Error") {
    FilmList.Screen(vm: FilmListViewModelStub(.error("Error...")))
  }

  final class FilmListViewModelStub: FilmListViewModelProtocol {
    init(_ state: FilmList.State) {
      self.state = state
    }

    let state: FilmList.State
    func onEvent(_: FilmList.Event) {}
  }
#endif
