//
//  FilmDetailResponse.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

struct FilmDetailResponse: Decodable {
  let episodeId: Int
  let openingCrawl: String
  let releaseDate: Date
}
