//
//  StarWarsJSONDecoderError.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import Foundation

enum StarWarsJSONDecoderError: LocalizedError {
  case parsingError

  var errorDescription: String? {
    switch self {
    case .parsingError:
      "Parsing error."
    }
  }
}
