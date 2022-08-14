//
//  Token.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/20/22.
//

import Foundation

struct Token {
  let username: String
  let token: String
  private let requestedAt = Date()
}

// MARK: - Codable

extension Token: Codable {
  enum CodingKeys: String, CodingKey {
    case username
    case token
  }
}

// MARK: - Helper properties

extension Token {
  var expiresAt: Date {
    Calendar.current.date(byAdding: .minute, value: 30, to: requestedAt) ?? Date()
  }
  var bearerToken: String {
    "Bearer \(token)"
  }
}
