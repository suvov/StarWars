//
//  ModuleFactory+filmList.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Combine
import SwiftUI
import UIKit

extension ModuleFactory {
  func makeFilmList() -> (
    vc: UIViewController,
    output: AnyPublisher<FilmListOutput, Never>
  ) {
    let vm = FilmList.ViewModel(
      filmsService: serviceFactory.filmsService
    )
    let screen = FilmList.Screen(vm: vm)
    let vc = UIHostingController(rootView: screen)
    return (vc, vm.output)
  }
}
