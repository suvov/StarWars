//
//  FilmDetailResponse.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

struct FilmDetailResponse: Decodable {
  let title: String
  let episodeId: Int
  let openingCrawl: String
}
