//
//  RequestProtocol.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/20/22.
//

import Foundation

protocol RequestProtocol {
  var path: String { get }
  var requestType: RequestType { get }
  var headers: [String: String] { get }
  var params: [String: Any] { get }
  var urlParams: [String: String?] { get }
  var addAuthorizationToken: Bool { get }
}

enum RequestType: String {
  case GET
  case POST
  case PUT
  case DELETE
}

extension RequestProtocol {
  var host: String {
    "localhost"
  }

  var addAuthorizationToken: Bool {
    true
  }

  var params: [String: Any] {
    [:]
  }

  var urlParams: [String: String?] {
    [:]
  }

  var headers: [String: String] {
    [:]
  }

  func createURLRequest(authToken: String) throws -> URLRequest {
    var components = URLComponents()
    components.scheme = "http"
    components.host = host
    components.port = 8080
    components.path = path

    if !urlParams.isEmpty {
      components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
    }

    guard let url = components.url else { throw NetworkError.invalidURL }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = requestType.rawValue

    if !headers.isEmpty {
      urlRequest.allHTTPHeaderFields = headers
    }

    if addAuthorizationToken {
      urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
    }

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

    if !params.isEmpty {
      if JSONSerialization.isValidJSONObject(params) {
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
      } else {
        if let book = params.first!.value as? Book  {
          urlRequest.httpBody = try? JSONEncoder().encode(book)
        } else if let bookType = params.first!.value as? BookType {
          urlRequest.httpBody = try? JSONEncoder().encode(bookType)
        } else if let client = params.first!.value as? Client {
          urlRequest.httpBody = try? JSONEncoder().encode(client)
        } else if let journal = params.first!.value as? Journal {
          urlRequest.httpBody = try? JSONEncoder().encode(journal)
        }
      }
    }
    return urlRequest
  }
}

public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  case incorrectCredentials
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    case .incorrectCredentials:
      return "Incorrect credentials."
    }
  }
}
