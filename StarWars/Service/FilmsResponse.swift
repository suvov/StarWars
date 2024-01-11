//
//  FilmsResponse.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

struct FilmsResponse: Decodable {
  let results: [Film]

  struct Film: Decodable {
    let title: String
  }
}
