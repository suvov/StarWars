//
//  APIError.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

enum APIError: LocalizedError {
  case invalidResponse
  case invalidData

  var errorDescription: String? {
    switch self {
    case .invalidResponse:
      "Invalid response."
    case .invalidData:
      "Invalid data."
    }
  }
}
