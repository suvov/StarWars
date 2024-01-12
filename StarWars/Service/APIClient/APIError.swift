//
//  APIError.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 10/01/2024.
//

import Foundation

enum APIError: LocalizedError {
  case invalidResponse
  case invalidURL

  var errorDescription: String? {
    switch self {
    case .invalidResponse:
      "Invalid response."
    case .invalidURL:
      "Invalid URL."
    }
  }
}
