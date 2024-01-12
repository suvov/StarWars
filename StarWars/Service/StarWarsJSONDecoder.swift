//
//  StarWarsJSONDecoder.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import Foundation

enum StarWarsJSONDecoder {
  static func decode<T>(
    _ type: T.Type,
    from data: Data
  ) throws -> T where T: Decodable {
    do {
      return try decoder.decode(T.self, from: data)
    } catch {
      throw StarWarsJSONDecoderError.parsingError
    }
  }

  private static let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
  }()
}
