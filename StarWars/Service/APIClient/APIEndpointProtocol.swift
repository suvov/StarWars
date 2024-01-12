//
//  APIEndpointProtocol.swift
//  StarWars
//
//  Created by Vladimir Shutyuk on 12/01/2024.
//

import Foundation

protocol APIEndpointProtocol {
  var baseURL: URL? { get }
  var path: String { get }
  var method: HTTPMethod { get }
}

enum HTTPMethod: String {
  case get = "GET"
}
