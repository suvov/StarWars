//
//  ModuleFactory+filmDetail.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import SwiftUI
import UIKit

extension ModuleFactory {
  func makeFilmDetail(filmId: Int, filmTitle: String) -> (
    vc: UIViewController,
    output: AnyPublisher<FilmDetailOutput, Never>
  ) {
    let vm = FilmDetail.ViewModel(
      filmDetailService: serviceFactory.filmDetailService,
      filmId: filmId
    )
    let screen = FilmDetail.Screen(vm: vm)
    let vc = UIHostingController(rootView: screen)
    vc.title = filmTitle
    return (vc, vm.output)
  }
}
